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
            ch = ch - 'a' + shiftnum;
            //If pass z
            if(ch > 25)
                ch -= 26;
            else if(ch < 0)
                ch += 26;
            //printf("%c", ch);
            printf("%c", ch + 'a');

        }
        else printf("%c", ch);

        ch = getchar();
    }
    return 0;
}

// 25
// This is a apple
