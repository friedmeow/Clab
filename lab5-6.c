#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    double a;
    char *ch;
    int numbers = 0, i = 0;
    //int one = 1;
    do 
    {
       
        ch = getchar();
        if(one) printf("\ncharacters:\n");
        one = 0;
        if('0' <= ch && ch <= '9')
            numbers = (numbers * 10) + (ch - '0');
        else if('a' <= ch && ch <= 'z')
            printf("%c", ch);
    } while(ch!='\n');
    printf("\ndigits:\n%d", numbers);
        
    return 0;
}


//1a2s8f3wd421sd
