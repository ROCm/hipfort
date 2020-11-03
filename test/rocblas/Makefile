.PHONY: all run clean

all: 
	hipfc saxpy.f03 -o saxpy -lrocblas	
run: all
	HIP_TRACE_API=1 ./saxpy
clean:
	rm -f saxpy *.o *.mod *~
