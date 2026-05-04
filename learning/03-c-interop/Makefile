NASM = nasm
GCC = gcc
CFLAGS = -m64 -fno-pie -nostdlib

SOURCES = $(wildcard *.asm)
OBJECTS = $(SOURCES:.asm=.o)
TARGETS = $(SOURCES:.asm=)

all: $(TARGETS)

%: %.o
	$(GCC) $(CFLAGS) $< -o $@

%.o: %.asm
	$(NASM) -f elf64 $< -o $@

clean:
	rm -f $(OBJECTS) $(TARGETS)

.PHONY: all clean
