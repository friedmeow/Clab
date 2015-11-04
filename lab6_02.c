#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(void)
{
    bool issame = 1;
    int i = 0, j = 0, k = 0, s = 0, count_t = 0, count_l = 0, toprint = 1;
    char tex[10][100] = {0}, same[50] = {0}, letter[10] = {0}, c;
    ///read inputs and put into 2D array
    while ((c = getchar()))
    {
        if((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
        {
            if(c >= 'a' && c <= 'z')    c -= 32;
            for(k = 0; k < j && c != tex[i][k]; ++k);
            if (k == j)
            {
                tex[i][j] = c;
                j++;
                count_l++;      ///count # of letters in each text
            }
        }
        else if(c == ',')
        {
            letter[i] = count_l;
            i++;
            j = 0;
            count_l = 0;
            count_t++;          ///count # of texts
        }
        else if(c == '\n')
        {
            letter[i] = count_l;
            count_t++;
            break;
        }
    }

///////////////////////

     for(i = 0; i < count_t; ++i)
        {
            printf("\n%d:", letter[i]);
            for(k = 0; k < letter[i]; ++k)
            {
                printf("%c", tex[i][k]);
            }
        }
     printf("\n////////////%d\n", count_t);

////////////////////

    ///compare
    for(j = 0; j < letter[0]; ++j)
    {
        issame = 1;
        for(i = 1; i < count_t && issame == 1; ++i)
        {
            issame = 0;
            for(k = 0; k < letter[i]; ++k)
            {
                if(tex[0][j] == tex[i][k])
                {
                   issame = 1;
                }
            }
        }
        if(issame == 1)
        {
            same[s] = tex[0][j];
            s++;
        }
    }

/*    for(i = 0; i < s-1; ++i)
    {
        for(j = i+1; j < s; ++j)
        {
            if(same[i] == same[j]);     ///don't print
            same[j] = 0;
        }
    }

    for(i = 0; i < s; ++i)
    {
        if(same[i] != 0) printf("%c", same[i]);
    }
*/
    for(i = 0; i < s; ++i)
        printf("%c", same[i]);

    return 0;
}
