#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main()
{
    bool issame = 0;
    int i = 0, j = 0, k = 0, da, db, dc, ps = 0, pe = 0, s = 0;
    char text[100] = {0}, start[15] = {0}, end[15] = {0}, c;

    printf("type text:");
    while((c = getchar()) != '\n')
    {
        text[i] = c;
        i++;
    }
    da = i;
    i = 0;

    printf("type start:");
    while((c = getchar()) != '\n')
    {
        start[i] = c;
        i++;
    }
    db = i;
    i = 0;

    printf("type end:");
    while((c = getchar()) != '\n')
    {
        end[i] = c;
        i++;
    }
    dc = i;
    i = 0;
   // printf("%s\n%s\n%s\n%d %d %d", text, start, end, da, db, dc);
    for(i = 0; i < da; ++i)
    {
        if(text[i] == start[0])     ///find head
        {
            issame = 1;
            for(j = 1; j < db; ++j)
            {
                if(text[i + j] != start[j])   issame = 0;
            }
        }
        if(issame == 1)          ///head been found
        {
            ps = i;             ///start position
            for(k = i + 1; k < da; ++k)      ///find tail
            {
                if(text[k] == end[0])
                {
                    issame = 1;
                    for(j = 1; j < dc; ++j)
                    {
                        if(text[k + j] != end[j])   issame = 0;
                    }
                    if(issame == 1)     ///tail been found
                    {
                        pe = k;         ///end position
                        for(s = ps; s <= (pe + dc - 1); ++s)
                        {
                            printf("%c", text[s]);
                        }
                        printf("\n");
                    }
                    issame = 0;
                }
            }
        }
    }
    return 0;
}
