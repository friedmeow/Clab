#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int integer = 0, i = 0, intchange = 0, ii = 0, k = 0, z = 0;
    int j = 1, sum = 0, rem = 0, sign = -1, res = 0, l = 0, h = 0;
    int newii = 0, div = 0;
    int old_integer = 0;

    printf("Enter an integer >= 0: ");
    scanf("%d", &integer);
    while(integer != -1)
    {
        sum = 0;
        intchange = integer;  

        for(h = 1, j = 1 ; intchange >= 10; i *= 10, j++)
        {
            intchange /= 10;
        }
        printf("%d", integer % 10);
        printf(" + ");

        //k = j;
        old_integer = integer;
        for( ii = 100 , k = 2; k <= j; k++, ii *= 10)
        {
            newii = ii;
            rem = integer % ii;
            for(h = k - 1; h > 0 && rem < 10; h--)
            { printf("0");}
            newii /= 10;
            div = newii;
            for( l = z = k; z > 0 && rem >= 10 ; z-- )
            {
                res = rem / div;
                printf("%d", res);
                //rem /= 10;
                rem %= newii;
                l--;
                if(rem < newii)
                {
                    for(--l; l > 0 && rem < newii; l--)
                    {
                        printf("0");
                        newii /= 10;
                    }
                }

                else newii /= 10;
                div /= 10;
            }
            printf("%d", rem);
            if(k == j) break;
            else printf(" + ");
        }

        for( k = 10 ; k <= (i * 10) ; k *= 10)
        {
            sum += (integer % k);
        }
        printf(" = %d\n", sum);


        printf("\n");
        printf("Enter an integer >= 0: ");
        scanf("%d", &integer);

    }



}
