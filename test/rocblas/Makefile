HIPFORT_HOME ?= /tmp/hipfort
include $(HIPFORT_HOME)/bin/Makefile.hipfort

OUTPUT_DIR ?= $(PWD)
LINKOPTS   += -L$(ROCM)/rocblas/lib -l rocblas

SAXPY_APP = $(OUTPUT_DIR)/rocblas

SAXPY_SRC = saxpy.f03

.DEFAULT_GOAL := all

$(SAXPY_APP): $(SAXPY_SRC)
	$(FC) $(SAXPY_SRC) $(LINKOPTS) -o $(SAXPY_APP)

all: $(SAXPY_APP)

run: $(SAXPY_APP)
	HIP_TRACE_API=1 $(SAXPY_APP)
clean:
	rm -f $(SAXPY_APP) *.o *.mod *~
