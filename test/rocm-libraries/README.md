# Upstream client samples, built against the generated bindings

These are the Fortran samples each library already ships in its own repository,
copied here **verbatim**. They are not hipFORT tests and were not written for
hipFORT: they are what a rocBLAS or rocSPARSE user compiles today against the
hand-written module the library installs as source
(`/opt/rocm/include/rocblas/rocblas_module.f90` and friends).

| Library | Source | Files |
| --- | --- | --- |
| rocBLAS | `projects/rocblas/clients/samples/` | 4 |
| rocSPARSE | `projects/rocsparse/clients/samples/` | 14 |

Taken from [ROCm/rocm-libraries](https://github.com/ROCm/rocm-libraries) at tag
`therock-10.0`.

## What they are testing

That the generated binding is a **drop-in replacement** for the hand-written
module it supersedes at 10.2.

The samples open with `use rocblas` / `use rocsparse`, which is exactly the
module name the generated binding provides — this is the half of the migration
where, as the migration guide puts it, "the `use` line does not even move". So
if the generated module really is compatible, these compile with no edit at all
and the only thing that changes is which library supplies the module.

That is why they are copied rather than adapted. **Do not modify them.** An edit
here, however small, silently converts a compatibility test into a test of
whatever we edited it into.

## Result: 2 of 18 build; the other 16 need one line each

Hence `BUILD_FORTRAN_CLIENT_SAMPLES`, `OFF` by default. Reproduce with:

```shell
cmake -S . -B build -DBUILD_FORTRAN_CLIENTS=ON -DBUILD_FORTRAN_CLIENT_SAMPLES=ON
cmake --build build --target hipfort_sample_rocblas_example_fortran_axpy
```

`example_fortran_axpy` and `example_fortran_scal` build and are the ones that
matter here: they are the two whose only difference from a hipFORT-style call was
the scalar convention, so they are what proves it is gone.

These samples pass pointer-mode scalars as `c_loc(alpha)`, because the
hand-written modules declare `alpha` and `beta` `type(c_ptr), value`. The
generated modules now do the same — the C parameter is a pointer the library reads
as host or device memory per `rocblas_set_pointer_mode`, and `type(c_ptr)` is the
only spelling that covers both — with the host form kept as the `_hscal` module
procedure so `rocblas_daxpy(handle, n, alpha, dx, 1, dy, 1)` still resolves too.

An earlier attempt published the host form as a *second* `bind(C)` specific
(`rocblas_daxpy_dptr`) on the same binding label. That compiles, but F2018 19.2
requires a binding label to be unique, and amdflang reported all 2200 pairs under
`-Wexternal-interface-mismatch`. A module procedure has no binding label, so the
current form serves both call styles and the warnings are gone.

What remains is two differences, neither of them deep.

### 1. `use <lib>_enums` (2 samples)

The enumerators moved into the library module, so the separate one is gone:

```
error: Cannot parse module file for module 'rocblas_enums'
```

Delete the line. That is the whole fix for `example_fortran_gemv.f90`, and it is
exactly what the rocBLAS monorepo PR does to its copy.

`example_fortran_trmm_v3` needs it too and still will not build, for a reason
that is not ours: it calls `rocblas_dtrmm` with twelve arguments, the in-place
form. These samples are taken at `therock-10.0`, and by 10.2 `rocblas_dtrmm` is
out-of-place — `C` and `ldc` are part of its signature, which is what the
sample's own `ROCBLAS_V3` branch passes. The generated interface follows the
10.2 header. An upstream API change, visible here because the samples are
pinned to an older tag.

### 2. Character output arguments (14 samples)

`rocsparse_get_git_rev` and `rocsparse_get_version` take
`character(c_char) :: rev(*)` in the hand-written module and
`type(c_ptr), value` in the generated one:

```
error: Actual argument type 'CHARACTER(KIND=1,LEN=12_8)' is not compatible
with dummy argument type 'c_ptr'
```

Pass `c_loc(rev)`, with `rev` declared `target`. This one line is why all
fourteen rocSPARSE samples fail: each opens by printing the library revision.
Fourteen failures reads like a deep problem and is not one.

Both differences are source-level only. The generated interfaces bind the same C
symbols with the same ABI, so nothing is wrong at the call boundary and no
symbol or link check can see them — which is the argument for keeping real
client code in the tree.

## What to do with this

The differences belong upstream, in the generator, not in a patch here: the
whole value of these files is that they are untouched. They also qualify a claim
in the migration guide. "Everything at the call level is unchanged" holds for
hipFORT users; for the in-tree users of rocBLAS and rocSPARSE it is very nearly
true, with the two one-line exceptions above.


## Two further caveats

The samples report failure with a Fortran `stop`, which exits with status 0, so
a runtime failure would otherwise be recorded as a passing test. Rather than
patch the sources, the CMake registration adds a `FAIL_REGULAR_EXPRESSION` on
the `Error:` prefix they print. (Nothing has reached the point of running yet.)

They also declare their own `hipMalloc` / `hipFree` / `hipMemcpy` interfaces
inline — there is a `TODO: hip workaround until plugin is ready` next to them —
so they bind those C symbols directly and never `use hip`. They therefore need
the HIP runtime at link time but not the HIP binding's module, and they do not
exercise it.
