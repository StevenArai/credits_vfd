#if !defined(_WIN32)
#define _POSIX_C_SOURCE 200809L
#endif
#include "host_time.h"
#if defined(_WIN32)
#include <windows.h>
double host_seconds(void) {
    LARGE_INTEGER now,frequency;
    QueryPerformanceCounter(&now); QueryPerformanceFrequency(&frequency);
    return (double)now.QuadPart/(double)frequency.QuadPart;
}
#else
#include <time.h>
double host_seconds(void) {
    struct timespec now;
    clock_gettime(CLOCK_MONOTONIC,&now);
    return now.tv_sec+now.tv_nsec/1000000000.0;
}
#endif
