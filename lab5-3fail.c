#include <stdio.h>
#include <stdlib.h>

int main(){

    int sum = 0, i = 0;
    char ch;
    printf("Please input text:");
    ch = getchar();
    while(ch != '\n')
    {
        if ('a' <= ch && ch <= 'z')
            ch = getchar();

        else
        {
            sum += atio(ch);
            printf("%d", sum);
            ch = getchar();
        }


    }
    printf("Number sum of this text is %d.\n", sum);

    return 0;
}
