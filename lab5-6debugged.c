#include <stdlib.h>
#include <stdio.h>
#include <math.h>
int main(void)
{
    char ch;
    int numbers = 0, i = 0, k = 0, z = 0, fzero = 8;
    long long chars = 0.0, hundreds = 1.0;
    //int one = 1;
    ch = getchar();
    if( ch == 0 )
    {
        fzero = 1;
        ch = getchar();
    }
    do
    {
        //ch = getchar();
        if('0' <= ch && ch <= '9')
            numbers = (numbers * 10) + (ch - '0');
        else if('a' <= ch && ch <= 'z')
        {
            chars = (chars * 100) + (ch - 'a');
            k++; //How many characters
            hundreds *= 100;
        }
        ch = getchar();

    } while(ch!='\n');
    printf("\ndigits:\n");
    if(fzero == 1)
    printf("0");
    printf("%d", numbers);
    printf("\ncharacters:\n");
    hundreds /= 100.0;
    //z = k, z--;
    for(;k > 0;k--)
    {

        ch = chars / hundreds ;
        ch += 'a';
        printf("%c", ch);
        chars = chars % hundreds;
        //z--;
        hundreds /= 100;
    }

    return 0;
}

//1a2s8f3wd421sd
