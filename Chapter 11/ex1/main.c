
#include <stdio.h>

extern int factorial(int k);

int main(void)
{
    int facto = factorial(3);

    printf("%d\n", facto);

    return 0;
}