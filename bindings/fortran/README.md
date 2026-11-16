# Fortran bindings, as in rocm-systems and rocm-libraries

Sandbox, not for merge. Each directory is the `bindings/fortran/<lib>/` of its
pull request in `rocm-systems` (`hip`, `roctx`) or `rocm-libraries` (the ten
others), copied as is, except the `.F90` modules, which are generated from the
ROCm 10.2 headers with [rocm-fortran-generator](https://github.com/ROCm/rocm-fortran-generator)
so that they link against an installed ROCm 10.2.

`build.sh` builds, installs and tests them in dependency order, as TheRock does:

```shell
ROCM_PATH=/opt/rocm bindings/fortran/build.sh
```

hipFORT itself (`lib/hipfort`, `test/`) is unchanged.
