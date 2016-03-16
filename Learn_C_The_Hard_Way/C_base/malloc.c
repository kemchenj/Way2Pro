#include <stdio.h>
#include <stdlib.h>

int main(void)
{
        int a[]={3};
        int *p;
        *p = a;

        printf("%d\n", *p);
        printf("%d\n", a[0]);

        return 0;
}
