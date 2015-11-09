#include <stdlib.h>
#include <stdio.h>

int main(void)
{

    int alphabets[26] = {0}, chID = 0, i = 0;
    char ch;
    int textcount = 0;
    do {
        ch = getchar();
        if('A' <= ch && ch <= 'Z') chID = ch - 'A';
        if('a' <= ch && ch <= 'z') chID = ch - 'a';
        if(ch == ',')
            textcount++;
        else if(0 <= chID && chID <= 25)
        {
            if(alphabets[chID] == textcount)
                alphabets[chID] ++;
        }
    } while (ch != '\n');
    textcount++;
    for(i = 0; i < 26; i++)
    {
        if(alphabets[i] == textcount)
        {
           printf("%c ", i + 'A');
            //printf("i:%d", i);
        }
    }
    return 0;
}

