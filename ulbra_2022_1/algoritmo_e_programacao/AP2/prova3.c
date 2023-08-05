#include <stdio.h>
#include <math.h>


int main(int argc, char const *argv[])
{
    float x = 3, y;
    y = x + pow(x,2);
    x += y;
    y++;
    x -= y;
    y /= 3;
    printf("%.2f",x+y);
    return 0;
}
