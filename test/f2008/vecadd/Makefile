.PHONY: run clean

all:
	hipfc -g -ggdb -O0 main.f03 hip_implementation.cpp -o main 
run: all
	./main

clean:
	rm -f main *.o *.mod
