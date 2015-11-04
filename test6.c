#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i = 0, j = 0, s = 0;
    int textend = 0, headend = 0, tailend = 0, same = 0, answerstart = 0, answerend = 0;
    char text[100] = {0}, head[50] = {0}, tail[50] = {0}, ch;
    printf("type text:");
    for(i = 0;(ch = getchar())!='\n';)
    {
        text[i] = ch;
        i++;
    }
    textend = i;
    printf("type start:");
    for(i = 0;(ch = getchar())!='\n';)
    {
        head[i] = ch;
        i++;
    }
    headend = i;
    printf("type end:");
    for(i = 0;(ch = getchar())!='\n';)
    {
        tail[i] = ch;
        i++;
    }
    tailend = i;

    for(i = 0;i < textend;i++)
    {
        if(text[i] == head[0]) same = 1;
        for(j = 1;j < headend; j++)
        {
            if(text[i+j] != head[j]) same = 0;
        }
        if(same == 1)
        {
            answerstart = i;
            for(++i;i < textend; i++)
            {
                if(text[i] == tail[0]) same = 1;
                for(j = 1;j < tailend; j++)
                {
                if(text[i+j] != head[j]) same = 0;
                }
            }
            if(same == 1) answerend = i;
            for(s = answerstart; s < (answerend + tailend - 1); s++)
            {
                printf("%c", text[s]);
            }
            printf("\n");
            for(s = 0;s < textend; s++) printf("%c", text[s]);

        }

    }
    return 0;
}
