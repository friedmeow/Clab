#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int integer = 0, i = 0, intchange = 0, ii = 0, k = 0;
    int j = 1, sum = 0, rem = 0, sign = -1;
    int remm = 0, summ = 0;
    
    printf("Enter an integer >= 0: ");
    while(scanf("%d", &integer) != EOF)
    {
        //****** Upper
        
        intchange = integer;
        
        for(i = 1 ; intchange >= 10; i *= 10)
        {
            intchange /= 10;
        }
        printf("%d", integer);
        sum = integer;
        
        k = i;
        
        for( ii = 10 , j = 1 ; ii <= i ; j++ , ii *= 10 )
        {
            rem = integer / ii;
            if ( j % 2 ) printf(" - ");
            else printf(" + ");
            printf("%d", rem);
        }
        for( k = 10 ; k <= i ; k *= 10)
        {
            sum += sign * (integer / k);
            sign *= -1;
        }
        printf(" = %d\n", sum);
     
        
        //****** Lower
        
        printf("%d", integer / i);
        summ = integer / i;
        for( ii = i / 10 ; ii >= 1 ; ii /= 10)
        {
            remm = integer / ii;
            printf(" + ");
            printf("%d", remm);
            summ += remm;
        }
        printf(" = %d\n", summ);

        printf("\n");
        printf("Enter an integer >= 0: ");
        
    }
    
    
    
}
