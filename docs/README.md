# Building the hipFORT documentation

The hipFORT documentation is built with [Sphinx](https://www.sphinx-doc.org) and
[Doxygen](https://www.doxygen.nl), wired together by
[rocm-docs-core](https://github.com/ROCm/rocm-docs-core). The published version lives at
<https://rocm.docs.amd.com/projects/hipfort/en/develop>.

## Prerequisites

* Python 3.10 or newer
* `doxygen`
* `gfortran` (the Fortran sources are preprocessed with it before Doxygen parses them)
* `graphviz` (optional, for the call/dependency graphs)

On Ubuntu:

```shell
sudo apt install doxygen gfortran graphviz
```

## Build

From the repository root, create a virtual environment, install the pinned Python
dependencies, and run Sphinx:

```shell
python3 -m venv .venv
source .venv/bin/activate
pip install -r docs/sphinx/requirements.txt
sphinx-build -b html docs docs/_build/html
```

Open `docs/_build/html/index.html` in a browser.

`docs/conf.py` preprocesses every `lib/hipfort/*.F90` file with
`gfortran -E -cpp -P -DUSE_FPOINTER_INTERFACES=1 -UUSE_CUDA_NAMES` into
`docs/doxygen/input/`, then `rocm-docs-core` runs Doxygen and integrates the result.

