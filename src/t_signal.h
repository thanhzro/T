#include <signal.h>
#include <stdio.h>
#include <stdlib.h>

static void segfault_handler(int sig) {
    fprintf(stderr, "\n[CRASH] Signal %d - Segmentation Fault\n", sig);
    fprintf(stderr, "Check: stack overflow, null pointer, array out of bounds\n");
    exit(1);
}

static void register_signals() {
    signal(SIGSEGV, segfault_handler);
    signal(SIGBUS, segfault_handler);
    signal(SIGABRT, segfault_handler);
}
