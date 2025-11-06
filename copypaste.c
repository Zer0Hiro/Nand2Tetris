#include <stdio.h>
#include <stdlib.h>

int main()
{
    for(int i = 1; i < 16; i++)
    {
        printf("FullAdder(a=a[%d], b=b[%d], c=car%d, sum=out[%d], carry=car%d);\n",i,i,i-1,i,i);
    }
}