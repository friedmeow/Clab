#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int NumDigits(int n)
{
    int i = 0;
    for(i = -1; n > 0; i++)
    {
        n /= 10;
    }
    return i;
}

int main()
{
    int number = 0;
    int Prize[6] = {19730, 2460, 137, 77, 57, 1};
    scanf("%d", &number);
    printf("%d", Prize[NumDigits(number)]);
    return 0;

}
