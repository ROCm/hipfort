HIPFORT_HOME ?= /tmp/hipfort
include $(HIPFORT_HOME)/bin/Makefile.hipfort

OUTPUT_DIR  ?= $(PWD)
LINKOPTS    +=  -L$(ROCM)/rocsparse/lib -l rocsparse

APP          = $(OUTPUT_DIR)/rocsparse

FSOURCES=$(wildcard *.f03)

.DEFAULT_GOAL := all

$(APP): $(FSOURCES)
	$(FC) $(FSOURCES)  -o $@ $(LINKOPTS)

all: $(APP)

run: $(APP)
	HIP_TRACE_API=1 $(APP)

clean:
	rm -f $(APP) *.o *.mod *~
