# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import os
from rocm_docs import ROCmDocs

temp_folder = ".doxygen/tmp"
os.system(f"rm -rf {temp_folder}")
os.system(f"mkdir -p {temp_folder}")
os.system(f"cp ../lib/hipfort/*.f {temp_folder}")
os.system(f"bash clean-module-files.sh {temp_folder}")

docs_core = ROCmDocs("hipfort Documentation")
docs_core.run_doxygen()
docs_core.setup()

for sphinx_var in ROCmDocs.SPHINX_VARS:
    globals()[sphinx_var] = getattr(docs_core, sphinx_var)
