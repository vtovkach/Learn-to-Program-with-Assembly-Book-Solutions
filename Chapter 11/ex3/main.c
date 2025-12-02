
#include <stdio.h>
#include <stdlib.h>

extern int numberTest(int);

extern int factorial(int);

extern int exponent(int, int);

int main(int argc, char *argv[])
{
    int result = numberTest(atoi(argv[1]));
    printf("result: %d\n", result);

    return 0;
}