
#include <stdio.h>

int main( )
{
    int an = 0, bn = 0;
    int n = 0, i = 0, j = 0, suma = 0, sumb = 0, sumc = 0;

    printf("Please input n:");
    scanf("%d", &n);

    for( j = n ; j <= n + 10; j++ )
    {
        for( i = 0 ; i <= 2 * j  ; i++ )
        {
            an = 2 * i;
            suma += an;
            bn = suma * i;
            sumb += bn;

        }
        sumc += sumb;
        sumb = 0, suma = 0;

    }
    //for( i = n; i <= n + 10; i++)
    //{
    //    sumc += sumb;
    //}
    /*an = 0, bn = 0;
    for( i = 0; i < n ; i++)
    {
        an = 2 * i;
        sumaa += an;
        bn = sumaa * i;
        sumbb += bn;
        sumcc += sumbb;
    }*/
    //printf("an: %d\n", suma);
    printf("c%d: %d\n", n, sumc);

    //printf("c%d: %d\n",n ,sumc - sumcc);


    return 0;
}

