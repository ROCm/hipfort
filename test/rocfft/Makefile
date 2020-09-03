
HIPFORT_ROOT ?= /tmp/hipfort
include $(HIPFORT_ROOT)/bin/Makefile.hipfort

OUTPUT_DIR  ?= $(PWD)
LINKOPTS    +=  -L$(ROCFFT_ROOT)/lib  -l rocfft

APP          = $(OUTPUT_DIR)/rocfft

FSOURCES=$(wildcard *.f03)

.DEFAULT_GOAL := all

$(APP): $(FSOURCES) 
	$(FC) $(FSOURCES)  -o $@ $(LINKOPTS)

all: $(APP)

run: $(APP)
	HIP_TRACE_API=1 $(APP)

clean:
	rm -f $(APP) *.o *.mod *~
