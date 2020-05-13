
HIPFORT_HOME ?= /tmp/hipfort
include $(HIPFORT_HOME)/bin/Makefile.hipfort

OUTPUT_DIR ?= $(PWD)
LINKOPTS   += -L$(ROCM)/hipblas/lib -l hipblas

DSCAL_APP = $(OUTPUT_DIR)/dscal
DGEMM_APP = $(OUTPUT_DIR)/dgemm
DGER_APP  = $(OUTPUT_DIR)/dger

DSCAL_SRC = dscal.f03
DGEMM_SRC = dgemm.f03
DGER_SRC  = dger.f03

.DEFAULT_GOAL := all

$(DSCAL_APP): $(DSCAL_SRC)
	$(FC) $(DSCAL_SRC) $(LINKOPTS) -o $(DSCAL_APP)

$(DGEMM_APP): $(DGEMM_SRC) 
	$(FC) $(DGEMM_SRC) $(LINKOPTS) -o $(DGEMM_APP)

$(DGER_APP): $(DGER_SRC) 
	$(FC) $(DGER_SRC) $(LINKOPTS) -o $(DGER_APP)

all: $(DSCAL_APP) $(DGEMM_APP) $(DGER_APP)

run: $(DSCAL_APP) $(DGER_APP) $(DGEMM_APP)
	HIP_TRACE_API=1 $(DSCAL_APP)
	HIP_TRACE_API=1 $(DGER_APP)
	HIP_TRACE_API=1 $(DGEMM_APP)

clean:
	rm -f $(DSCAL_APP) $(DGEMM_APP) $(DGER_APP) *.o *.mod *~
