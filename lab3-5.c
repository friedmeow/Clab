#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    int X = 0, Y = 0;
    
    printf("Please input X: ");
    scanf("%d", &X);
    printf("Please input Y: ");
    scanf("%d", &Y);
    
    int xandy = (X % 2) * (Y % 2);
    printf("X AND Y = %d\n", xandy);
    
    int xory = (X % 2) + (Y % 2) - (X % 2) * (Y % 2);
    printf("X OR Y = %d\n", xory);

    int xnandy = !((X % 2) * (Y % 2));
    printf("X NAND Y = %d\n", xnandy);
    
    int xxory = ((X % 2) + (Y % 2)) % 2;
    printf("X XOR Y = %d\n", xxory);

    return 0;
}
