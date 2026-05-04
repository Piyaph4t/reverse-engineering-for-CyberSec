#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define NOT_SMALL 64
#define SMALL 32 

void get_shell() {
    printf("GOT INTO GET SHELL");
    system("/bin/sh");
}

int vuln() {
    char buf[SMALL]={0};
    int n =    read(0, buf ,NOT_SMALL);
    return n;
}

int main() {
    vuln();
    return 0;
}
