#include <stdlib.h>
#include <stdio.h>

int main(void)
{

    int sum = 0, tempsum = 0;
    char ch;
    printf("Please input text:");
    ch = getchar();
    while(ch != '\n')
    {
        if('0' <= ch && ch <= '9')
            tempsum = (tempsum * 10) + (ch - '0');
        else
        {
            sum += tempsum;
            tempsum = 0;
        }
        ch = getchar();
    }
    sum += tempsum;
    printf("Number sum of this text is %d", sum);
    return 0;
}

