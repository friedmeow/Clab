#include <stdlib.h>
#include <stdio.h>

int main(void)
{

    int size = 0, rot = 0;
    scanf("%d %d", &size, &rot);
    
    int array[20][20] = {0}, i = 0, k = 0, l = 0;
    int group = 0, t = 0, sp = 0;
    if(rot == 1)
    {
        group = size - 2;
        i = 1;
        while(group >= 0)
        {
            //Up
            l = k = sp;
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                l++;
            }
            //Right

            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                k++;
            }
            //Bottom
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                l--;
            }
            //left
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                k--;
            }
            group -= 2;
            sp++;
        }    
    }
    else if(rot == 2)
    {
        group = size - 2;
        i = 1;
        while(group >= 0)
        {
            //Up
            l = k = sp;
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                k++;
            }
            //Right
            
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                l++;
            }
            //Bottom
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                k--;
            }
            //left
            for(t = group; t >= 0; t--, i++)
            {
                array[k][l] = i;
                l--;
            }
            group -= 2;
            sp++;
        }
    }
    

    for(k = 0;k < size;k++)
    {
        for(l = 0;l < size;l++)
        {
            if(array[k][l] == 0)    array[k][l] = i;
            printf("%5d", array[k][l]);
        }
        printf("\n");
    }
    //printf("Hello, World!\n");
    return 0;
}

