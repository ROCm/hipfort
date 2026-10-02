###############################################################################
# Copyright (C) 2023-2026 Advanced Micro Devices, Inc. All rights reserved.
#
# SPDX-License-Identifier: MIT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
###############################################################################

# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

import glob
import os
import re
import shutil
import subprocess
from pathlib import Path
from typing import Any, Dict, List

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

for filename in sorted(
    glob.glob("../lib/rocm-systems/*/fortran/*.[fF]90")
    + glob.glob("../lib/rocm-libraries/*/fortran/*.[fF]90")
):
    path = Path(filename)
    # -P is to disable embedding line information
    subprocess.check_call(
        [
            gfortran_exe,
            "-E",
            "-cpp",
            "-P",
            # The per-rank array overloads. Without it Doxygen documents only
            # the raw type(c_ptr) specifics, since the overloads are compiled
            # out rather than merely hidden.
            "-DUSE_ASSUMED_SHAPE",
            "-UUSE_CUDA_NAMES",
            str(path),
            "-o",
            str(preprocessed_out_dir / path.name),
        ]
    )

with open('../CMakeLists.txt', encoding='utf-8') as f:
    match = re.search(r'.*\bhipfort VERSION\s+\"?([0-9.]+)[^0-9.]+', f.read())
    if not match:
        raise ValueError("HIPFORT_VERSION not found!")
    version_number = match[1]
left_nav_title = f"hipFORT {version_number} documentation"

# for PDF output on Read the Docs
project = "hipFORT documentation"
author = "Advanced Micro Devices, Inc."
copyright = "Copyright (c) 2026 Advanced Micro Devices, Inc. All rights reserved."
version = version_number
release = version_number

external_toc_path = "./sphinx/_toc.yml"

docs_core = ROCmDocs(left_nav_title)
docs_core.run_doxygen(doxygen_root="doxygen", doxygen_path="doxygen/xml")
docs_core.enable_api_reference()
docs_core.setup()

external_projects_current_project = "hipfort"

for sphinx_var in ROCmDocs.SPHINX_VARS:
    globals()[sphinx_var] = getattr(docs_core, sphinx_var)

# rocm-docs-core might or might not have changed these yet (depending on version),
# and we don't want to wipe their settings if they did
if not "html_theme_options" in globals():
    html_theme_options: Dict[str, Any] = {}
if not "exclude_patterns" in globals():
    exclude_patterns: List[str] = []

html_theme_options["show_navbar_depth"] = 2
exclude_patterns.append("doxygen/input")
exclude_patterns.append("README.md")
