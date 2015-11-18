#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
// 2 ; 1,1 1,1 1,2 //3 0,0 3,3 2,4
int main()
{
    int number = 0, x = 0, y = 0, row = 0, col = 0;
    char map[5][5] = {0};
    int count = 0;
    scanf("%d", &number);
    while(number > 0)
    {
        scanf("%d ,%d", &x, &y);
        while( x < 0 || x > 4 || y < 0 || y > 4 ||  map[x][y] == 'X')
        {
            printf("wrong input, try again.\n");
            scanf("%d ,%d", &x, &y);
        }
        map[y][x] = 'X';
        for(row = y - 1, col = x - 1; col < x + 1; col++)
        {
            if(row < 0 || row > 4 || col < 0 || col > 4 || map[row][col] == 'X') ;
            else map[row][col]++;
        }
        for(col = x + 1, row = y - 1; row < y + 1; row++)
        {
            if(row < 0 || row > 4 || col < 0 || col > 4 || map[row][col] == 'X') ;
            else map[row][col]++;
        }
        for(col = x + 1, row = y + 1; col > x - 1; col--)
        {
            if(row < 0 || row > 4 || col < 0 || col > 4 || map[row][col] == 'X') ;
            else map[row][col]++;
        }
        for(col = x - 1, row = y + 1; row > y - 1; row--)
        {
            if(row < 0 || row > 4 || col < 0 || col > 4 || map[row][col] == 'X') ;
            else map[row][col]++;
        }




        number--;
    }

    for(x = 0; x < 5; x++)
    {
        for(y = 0; y < 5; y++)
        {
            if(map[x][y] == 'X') printf("%c", map[x][y]);
            else printf("%c", map[x][y]+'0');
        }
        printf("\n");
    }

    return 0;
}
