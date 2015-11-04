#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int main()
{
    char text[100];
    int check[100] = {false}, i = 0, j = 0, k = 0, z = 0, same = 0, q = 0;
    scanf("%s",text);
    for(i = 0; i < 100; i++)
    {
        //if(text[i] == ',')
        //    text[i] = 26;
        if('A' <= text[i] && text[i] <= 'Z')
        {
            text[i] = text[i] - 'A' + 1;
        }
        
        if('a' <= text[i] && text[i] <= 'z')
        {
            text[i] = text[i] - 'a' + 1;
        }
        
    }
    
    for(i = 0; text[i] < 100 ;i++)
    {
        if(text[i] == ',')
        {
            k = i;
            for(--i;i >= j; i--)
            {
                z = (int) text[i];
                //printf("%d", z);
                check[z] = (int) z;
            }
            i = j = k;
            break;
        }
    }
    //k = 0, j = 0;
    for(i = 0; i < 100 ;i++)
    {
        //printf("1");
        z = 1;
        if(text[i] == ',' || text[i] == '\0')
        {
            q = k = i;
            for(;z < 100;)
            {
                //printf("2");
                k--;
                for(i = k;i >= j; i--)
                {
              //      printf("222");
                    if (check[z] == text[i])
                    {
                        same = 1;
                        break;
                    }
                //printf("%d", same);
                if(same == 0) check[z] = false;
                same = 0;
                z++;
            }
            j = i = q;
        }
    }
    
    
/*
    for(++i; text[i] != '\0' ;i++)
    {
        k = i;
        if(text[i] == 99)
        {
            for(--i;i >= j; i--)
            {
                z = i;
                i = text[i];
                //if(check[i]!=true)
                //    check[i] = false;
                //check[i] = true;
                i = z;
            }
            i = j = k;
        }
    }
*/
  
    for(i = 0; i < 100; i++)
    {
        //if(check[i])
        {
            check[i] += 'A' - 1;
            printf("%c", check[i]);
        }
    }

    return 0;
    
}
