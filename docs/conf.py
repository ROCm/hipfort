# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import glob
import os
import shutil
import subprocess
from pathlib import Path

from rocm_docs import ROCmDocs

# Preprocess the fortran sources with gfortran, because doxygen doesn't seem
# to correctly parse them, even with preprocessing turned on (and with
# upper-case file names as convention)
# preprocessed_out_dir has to be kept in sync with the Doxyfile's INPUT
preprocessed_out_dir = Path("doxygen", "input")
try:
    os.mkdir(preprocessed_out_dir)
except FileExistsError:
    pass

gfortran_exe = shutil.which("gfortran")
if gfortran_exe is None:
    raise RuntimeError("Couldn't find the fortran compiler!")

for filename in glob.glob("../lib/hipfort/*.f"):
    path = Path(filename)
    # -P is to disable embedding line information
    subprocess.check_call(
        [
            gfortran_exe,
            "-E",
            "-cpp",
            "-P",
            "-DUSE_FPOINTER_INTERFACES=1",
            "-UUSE_CUDA_NAMES",
            str(path),
            "-o",
            str(preprocessed_out_dir / path.name),
        ]
    )

docs_core = ROCmDocs("hipfort Documentation")
docs_core.run_doxygen(doxygen_root="doxygen", doxygen_path="doxygen/xml")
docs_core.enable_api_reference()
docs_core.setup()

for sphinx_var in ROCmDocs.SPHINX_VARS:
    globals()[sphinx_var] = getattr(docs_core, sphinx_var)
