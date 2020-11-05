.PHONY: run all clean

run: all
	./rocfft
all:
	hipfc rocfft.f03 -o rocfft -lrocfft
clean:
	rm -f rocfft *.o *.mod
