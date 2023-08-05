#include <stdio.h>
#include <math.h>

int main(int argc, char const *argv[])
{
    float x=3, y=2;
    y += x;
    x ++ ;
    y -- ;
    x *= y;
    y /= 3;

    printf("%07.2f",x+y);
    return 0;
}
