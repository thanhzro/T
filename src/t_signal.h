#include <signal.h>
#include <stdio.h>
#include <stdlib.h>

static char _g_current_func[64] = "";
static int _g_current_ip = 0;
static const char *_g_current_file = NULL;

static void segfault_handler(int sig) {
    fprintf(stderr, "\n[CRASH] Signal %d\n", sig);
    if(_g_current_file)
        fprintf(stderr, "File: %s\n", _g_current_file);
    if(_g_current_func[0]) fprintf(stderr, "Func: %s\n", _g_current_func);
    fprintf(stderr, "IP: %d\n", _g_current_ip);
    fprintf(stderr, "Cause: null ptr / stack overflow / array OOB\n");
    exit(1);
}

static void register_signals() {
    signal(SIGSEGV, segfault_handler);
    signal(SIGBUS, segfault_handler);
    signal(SIGABRT, segfault_handler);
}
