
HIPFORT_HOME ?= /tmp/hipfort
include $(HIPFORT_HOME)/bin/Makefile.hipfort

OUTPUT_DIR  ?= $(PWD)
LINKOPTS    +=  -L$(ROCM)/rocfft/lib  -l rocfft

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
