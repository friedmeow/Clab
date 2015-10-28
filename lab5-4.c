#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    int shiftnum = 0;
    char ch;
    printf("Please input shift: ");
    scanf("%d", &shiftnum);
    ch = getchar();
    printf("Please input plain text: ");
    ch = getchar();
    printf("Cipher text: ");;
    while(ch!='\n')
    {
        //Upper to Lower case
        if('A' <= ch && ch <= 'Z')
        {
            ch = ch - 'A' + 'a';
        }
        //Shift
        if('a' <= ch && ch <= 'z')
        {
            ch += shiftnum;
            //If pass z
            if(ch >= 'z')
                ch -= ('z' - 'a' + 1);
            else if(ch < 'a')
                ch -= ('a' - 'z' - 1);
            printf("%c", ch);
        }
        else printf("%c", ch);
        ch = getchar();
    }
    return 0;
}

