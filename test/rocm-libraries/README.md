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

## Result: they do not build. All 18 fail.

Hence `BUILD_FORTRAN_CLIENT_SAMPLES`, `OFF` by default. Reproduce with:

```shell
cmake -S . -B build -DBUILD_FORTRAN_TESTS=ON -DBUILD_FORTRAN_CLIENT_SAMPLES=ON
cmake --build build --target hipfort_sample_rocblas_example_fortran_axpy
```

The failures are not 18 separate problems. They are three systematic differences
between the hand-written interface and the generated one, and the first accounts
for most of them.

### 1. Scalar arguments: `type(c_ptr)` versus a typed dummy

`rocblas_daxpy`, and every other routine taking an `alpha` / `beta`:

```fortran
! hand-written (rocblas_module.f90)      ! generated
type(c_ptr), value :: alpha              real(c_double) :: alpha
```

So the sample's call site, which passes `c_loc(alpha)`, has nothing to resolve
against:

```
Error: There is no specific function for the generic 'rocblas_daxpy'
```

Also seen on `rocblas_sscal`, and on `rocsparse_dcsrmv`, `dcoomv`, `dellmv`,
`dhybmv`, `dbsrmv`.

Note that the two are **ABI-identical**: a non-`value` Fortran dummy is passed
by address, which is the same machine-level argument as `c_loc(alpha)` passed by
value. Nothing is wrong at the call boundary. The break is purely at the source
level, which is precisely why it does not show up in a symbol test and only a
real client catches it.

### 2. Character arguments

`rocsparse_get_git_rev`:

```fortran
! hand-written                           ! generated
character(c_char) :: rev(*)              type(c_ptr), value :: rev
```

```
Error: Type mismatch in argument 'rev'; passed CHARACTER(12) to TYPE(c_ptr)
```

The generator does emit `_cstr` convenience overloads elsewhere, but not for
this routine, so the generic has no character form to resolve to.

### 3. Knock-on resolution failures

Several samples call more than one affected routine, so one file reports several
of the errors above. Fixing the two classes above should clear all 18; that has
not been verified, because it needs the generator change first.

## What to do with this

The differences are real and they belong upstream, in the generator, not in a
patch here — the whole value of these files is that they are untouched. They
also sharpen a claim in the migration guide: "Everything at the call level
(routine names, arguments, calling styles) is unchanged" holds for hipFORT
users, but **not** for the in-tree users of rocBLAS and rocSPARSE, whose scalar
and string call sites do change. The guide's existing advice to "check the call
sites where a hand-written interface and a generated one can legitimately
differ" is right, but understates it: this is systematic, not occasional.

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
