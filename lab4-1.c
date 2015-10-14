#include <stdio.h>
#include <stdlib.h>

int main()
{
    int number = 0, i = 0, tempnum = 0;
    for(;;)
    {
    printf("Enter a number:");
    scanf("%d", &number);

    if(number == -1) break;
    if(number == 2)  printf("it is a prime number\n");
    for(i = 3; i < number; i++)
    {
        tempnum = (number % i);
        if(tempnum == 0)
        {
            printf("it is a composite number\n");
            break;
        }

    }
        if(tempnum != 0)printf("it is a prime number\n");

    }
}
