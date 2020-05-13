
HIPFORT_HOME ?= /tmp/hipfort
include $(HIPFORT_HOME)/bin/Makefile.hipfort

OUTPUT_DIR ?= $(PWD)
APP         = $(OUTPUT_DIR)/vecadd

.DEFAULT_GOAL := all

all: $(APP)

$(APP): $(OUTPUT_DIR)/main.o $(OUTPUT_DIR)/hip_implementation.o
	$(FC) $^ $(LINKOPTS) -o $(APP)

$(OUTPUT_DIR)/main.o: main.f03
	$(FC)  -c $^ -o $(OUTPUT_DIR)/main.o

$(OUTPUT_DIR)/hip_implementation.o: hip_implementation.cpp
	$(CXX) -c $^ -o $(OUTPUT_DIR)/hip_implementation.o

run: $(APP)
	HIP_TRACE_API=1 $(APP)

clean:
	rm -f $(APP) *.o *.mod *~
