#include <stdio.h>
#include <stdlib.h>

int main()
{
    int height, width, x, y, i, j;
    char arr[100][100] = {0};
    printf("input height, width:");
    scanf("%d %d", &height, &width);
    printf("input bomb position:");
    scanf("%d %d", &y, &x);

    ///set wall
    for(i = 0; i < width; ++i)  arr[0][i] = '#';
    for(i = 0; i < width; ++i)  arr[height - 1][i] = '#';
    for(i = 0; i < height; ++i)  arr[i][0] = '#';
    for(i = 0; i < height; ++i)  arr[i][width - 1] = '#';

    if(x >= width || y >= height)
    {
        printf("Wrong place!");
    }

    else
    {
        arr[y][x] = 'O';        ///set bomb position

        for(i = x - 1, j = y - 1; i > 0 && j > 0; --i, --j)     ///2nd coordinate
        {
            arr[j][i] = 'X';
        }

        for(i = x + 1, j = y - 1; i < width - 1 && j > 0; ++i, --j)     ///1st coordinate
        {
            arr[j][i] = 'X';
        }

        for(i = x - 1, j = y + 1; i > 0 && j < height; --i, ++j)     ///3rd coordinate
        {
            arr[j][i] = 'X';
        }

        for(i = x + 1, j = y + 1; i < width - 1 && j < height - 1; ++i, ++j)     ///4th coordinate
        {
            arr[j][i] = 'X';
        }

        for(i = 0; i < height; ++i)
        {
            for(j = 0; j < width; ++j)
                printf("%c", arr[i][j]);
            printf("\n");
        }

    }

    return 0;
}
