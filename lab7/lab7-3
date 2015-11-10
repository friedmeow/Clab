#include <stdio.h>

int main(void)
{
    char map[100][100];
    int he = 0, wi = 0;
    int k = 0, l = 0;
    int row = 0, col = 0;
    printf("Please input the height and witdh: ");
    scanf("%d %d", &he, &wi);
    printf("Please input bomb position(row and column): ");
    scanf("%d %d", &row, &col);

    for(k = 0, l = 0; l < wi; l++)
        map[k][l] = '#';
    for(k = he - 1, l = 0; l < wi; l++)
        map[k][l] = '#';
    for(l = 0, k = 1; k < he - 1; k++)
        map[k][l] = '#';
    for(l = wi - 1, k = 1; k < he - 1; k++)
        map[k][l] = '#';


        map[row][col] = 'O';
        //right up
        for(l = row - 1, k = col + 1; l > 0 && k < wi - 1; l--, k++)
            map[l][k] = 'X';
        //left up
        for(l = row - 1, k = col - 1; l > 0 && k > 0; l--, k--)
            map[l][k] = 'X';
        //right down
        for(l = row + 1, k = col + 1; l < he - 1 && k < wi - 1; l++, k++)
            map[l][k] = 'X';
        // left down
        for(l = row + 1, k = col - 1; l < he - 1 && k > 0; l++, k--)
            map[l][k] = 'X';

    if(row <= 0 || col <= 0 || row >= he - 1 || col >= wi - 1)
    {
        printf("Wrong bomb position!\n");
    }
    else
    {
        for(k = 0;k < he;k++)
        {
            for(l = 0; l < wi; l++)
            {
                printf("%c",map[k][l]);
            }
            printf("\n");
        }
    }

    return 0;
}
