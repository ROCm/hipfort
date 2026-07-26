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

`docs/conf.py` preprocesses every `lib/hipfort/*.F90` file with
`gfortran -E -cpp -P -DUSE_FPOINTER_INTERFACES=1 -UUSE_CUDA_NAMES` into
`docs/doxygen/input/`, then rocm-docs-core runs Doxygen and integrates the result.

> **Note**
> rocm-docs-core fetches theme and version data from GitHub (`raw.githubusercontent.com`)
> at build time. If the build stops with an SSL error (`CERTIFICATE_VERIFY_FAILED`),
> Python is using a CA bundle (usually `certifi`'s) that does not include your network's
> certificate. Point it at the system CA bundle before building:
>
> ```shell
> export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
> export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
> ```
>
> The paths above are for Debian/Ubuntu; on Fedora/RHEL use
> `/etc/pki/tls/certs/ca-bundle.crt`.

## Generated content

Two parts of the docs are generated, not hand-edited:

* **Fortran interface pages** come from Doxygen parsing `lib/hipfort/*.F90`.
* **Supported-API tables** (`docs/doxygen/input/supported_api_<lib>.md`) are written by
  `src/tools/gen_supported_api.py` in the
  [rocm-fortran](https://github.com/ROCm/rocm-fortran) generator repository. Each row is a
  Markdown link to the interface's Doxygen page, so the tables are clickable both on GitHub
  and in the rendered docs. Those URLs embed the Doxygen page name, which depends on the
  Doxygen version, so the tables must be regenerated when the Doxygen version changes.

Regenerate everything (bindings, tables, and the Doxygen denylist) with a single command
from the generator repo:

```shell
./regenerate.sh /path/to/hipfort
```
