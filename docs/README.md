# Building the hipFORT documentation

The hipFORT documentation is built with [Sphinx](https://www.sphinx-doc.org) and
[Doxygen](https://www.doxygen.nl), wired together by
[rocm-docs-core](https://github.com/ROCm/rocm-docs-core). The published version lives at
<https://rocm.docs.amd.com/projects/hipfort/en/latest/>.

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

`docs/conf.py` drives the rest automatically:

1. It preprocesses every `lib/hipfort/*.F90` file with
   `gfortran -E -cpp -P -DUSE_FPOINTER_INTERFACES=1 -UUSE_CUDA_NAMES` into
   `docs/doxygen/input/` (Doxygen does not preprocess Fortran reliably on its own).
2. rocm-docs-core runs Doxygen over `docs/doxygen/` and integrates the result into the
   Sphinx site.

> **Note**
> rocm-docs-core fetches theme and version data from GitHub (`raw.githubusercontent.com`)
> at build time. If the build stops with an SSL error
> (`CERTIFICATE_VERIFY_FAILED`), Python is using a CA bundle (usually `certifi`'s) that
> does not include your network's certificate. Point it at the system CA bundle before
> building:
>
> ```shell
> export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
> export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
> ```
>
> The paths above are for Debian/Ubuntu; on Fedora/RHEL use
> `/etc/pki/tls/certs/ca-bundle.crt`.

## Supported-API tables

The `docs/doxygen/input/supported_api_<lib>.md` tables are generated, not hand-edited.
They are produced by `src/tools/gen_supported_api.py` in the
[rocm-fortran](https://github.com/ROCm/rocm-fortran) generator repository, which reads
`lib/hipfort/*.F90` and writes the tables (including the Doxygen links to each interface).
Regenerate them there whenever the interfaces change; do not edit them by hand.
