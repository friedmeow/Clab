//Sum not done
//This is so long 


#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int main(void)
{
    int magic[15][15] = {false};
    int size = 0;
    int k = 0, l = 0, i = 1;
    int ck = 0, cl = 0;
    int sum = 0, checksum = 0;
    printf("type square_size(odd):");
    scanf("%d", &size);

    l = size / 2;
    k = size - 1;
    for(i = 1; i <= size * size; i++)
    {

        magic[k][l] = i;
        ck = k, cl = l;
        ck++, cl++;
        if(ck == size) ck = 0;
        if(cl == size) cl = 0;
        if(magic[ck][cl])
        {
            k--;
            if(k < 0) k = size - 1;
        }
        else
        {
             k++, l++;
            if(k == size) k = 0;
            if(l == size) l = 0;
        }

    }
//CheckSum
    for(k = 0, l = 0; l < size; l++)
    {
        checksum += magic[k][l];
    }
//Print Square
    for(k = 0; k < size; k++)
    {
        for(l = 0; l < size; l++)
        {
            printf("%5d", magic[k][l]);
        }
        printf("\n");
    }
//Sum
        printf("\n");

    for(k = 0; k < size; k++)
    {
        for(l = 0; l < size; l++)
        {
            printf("%4d+", magic[k][l]);
            sum += magic[k][l];
        }
        printf("=%d", sum);

/*
        if(checksum == sum)
        {
        for(l = 0; l < size; l++)
            printf("%4d+", magic[k][l]);
            printf("=%d", sum);
            sum = 0;
        }
        else
        {
            printf("Validation Failed");
            break;
        }
*/
        printf("\n");
    }

      printf("\n");

    for(l = 0; l < size; l++)
    {
        for(k = 0; k < size; k++)
        {
            printf("%4d+", magic[k][l]);
            sum += magic[k][l];
        }
        printf("=%d", sum);
        sum = 0;
        printf("\n");
    }

        printf("\n");

    for(l = 0, k = 0; l < size && k < size; k++, l++)
    {
        printf("%4d+", magic[k][l]);
        sum += magic[k][l];
    }
        printf("=%d", sum);
        sum = 0;
        printf("\n");

    for(l = size - 1, k = 0; l >= 0 && k < size; k++, l--)
    {
        printf("%4d+", magic[k][l]);
        sum += magic[k][l];
    }
        printf("=%d", sum);
        sum = 0;
        printf("\n");
    return 0;
}
