#include <stdio.h>
#include <stdlib.h>

int main()
{
    int size, fill = 1, i = 0, j = 0, s, k, temi, temj;
    int square[15][15] = {0}, check[15][15] = {0};
    printf("input size:");
    scanf("%d", &size);

    if(size%2 != 0)
    {
        i = size - 1;
        j = size / 2;
        while(fill != (size*size + 1))
        {
            if(square[i][j] == 0)           ///valid position
            {
                temi = i;
                temj = j;
                square[i][j] = fill;
                fill++;
                if((i + 1) >= size)   i = 0;          ///over pass bottom
                else    i += 1;

                if((j + 1) >= size)   j = 0;          ///over pass right hand side
                else    j += 1;
            }

            else if(square[i][j] != 0)      ///has been used
            {
                i = temi;
                i -= 1;
                j = temj;
                if(i < 0)
                i = size - 1;
            }
        }

        for(s = 0; s < size; ++s)
        {
            for(k = 0; k < size; ++k)
            {
                printf("%3d", square[s][k]);
            }
            printf("\n");
        }

    }



    else if(size%2 == 0)        ///invalid square (even)
    {

    }


    return 0;
}
