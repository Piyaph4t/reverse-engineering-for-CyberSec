CC = gcc
CFLAGS = -m64 -fno-pie -z execstack -g

TARGETS = vulnerable

all: $(TARGETS)

vulnerable: vulnerable.c
	$(CC) $(CFLAGS) vulnerable.c -o vulnerable

clean:
	rm -f $(TARGETS) *.o

.PHONY: all clean
