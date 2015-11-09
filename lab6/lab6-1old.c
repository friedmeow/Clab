#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int main(void)
{
    char text[100] = {0};
    int ifnumber = 1, i = 0,k = 0, j = 0;
    scanf("%s", text);

    for(i = 0; i < 25; i++)
    {
        if('0' <= text[i] && text[i] <= '9')
            text[i] = 1;
    }

    for(i = 0; i < 25; i++)
    {
        if(text[i] == 1)
        {
            k = i; //Save Index
            for(--i; i >= j; i--)
                printf("%c", text[i]);
            //printf("%c", text[k]);
                printf("_");
            j = i = k;
            j++;
        }
        else if(text[i] =='\0')
        for(;j < i;j++)
            printf("%c", text[j]);
    }
    return 0;
}

//123abcd456efg89apple
