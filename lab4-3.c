#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int integer = 0, i = 0, intchange = 0, out = 0, k = 0, ten = 0;
    printf("Enter an integer >= 0: ");
    while(scanf("%d", &integer) != EOF)
    {
        /*intchange = integer;
        for(i = 0; intchange >= 10; i++)
        {
            intchange /= 10;
        }

        printf("%d", integer);
        for(k = 1; k < i ; k++ )
        {
            out = integer % 10;
            printf("%d\n ", out);

            out = out * pow(10, k);
            printf("%d ", out);
        }
        */
        out = pow(10, 2);

        printf("Enter an integer >= 0: ");

    }



}
