#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char ch, checkch, firstch = 'a', lastch = 'a';
    printf("Please enter text:");
    checkch = ch = getchar();
    //printf("%c", ch);
    if(ch < 'a' || ch > 'z') ch = getchar();
    while(checkch <= ch)
    {
        while(firstch <= ch)
        {
            if(firstch != ch) printf("-");
            else printf("%c", ch);
            firstch++;
        }
        checkch = ch;
        ch = getchar();
        if(ch < 'a' || ch > 'z') ch = getchar();

    }
    printf("\n");
    for(;lastch <= 'z'; lastch++) printf("%c", lastch);
    return 0;
}

