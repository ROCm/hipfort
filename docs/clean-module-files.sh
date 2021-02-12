cd $1
for f in *.f; do gfortran -E -cpp -DUSE_FPOINTER_INTERFACES -UUSE_CUDA_NAMES $f | grep -v "# [0-9]\+" > ${f/.f/.f03}; done
