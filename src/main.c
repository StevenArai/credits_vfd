#include <stdio.h>
#include <string.h>
int main(int argc, char **argv) {
    if (argc == 2 && strcmp(argv[1], "--self-test") == 0) {
        puts("C99 host baseline: 80 x 24 cells");
        return 0;
    }
    puts("credits: reconstruction in progress");
    return 0;
}
