// 5566 ---> 6 + 66 + 566 + 5566 = 6204

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(void)
{
    int numberinput = 0, numberchange = 0;
    double j = 0, i = 0;
    int rem = 0, res = 0, div = 0, divforres = 0;
    int sum = 0;
    
    printf("Enter an integer >=0: ");
    scanf("%d", &numberinput);
    while(numberinput != (-1))
    {
        numberchange = numberinput;
        j = 0, i = 0;
        rem = 0, res = 0, div = 0, divforres = 0;
        sum = 0;
        //Compute Digits
        for(i = 0; numberchange > 0; i++)
        {
            numberchange /= 10;
        }
        
        printf("%d + ", numberinput % 10);
        
        //Show Numbers
        numberchange = numberinput;
        for(j = 2, div = 100; j < i; j++, div *= 10)
        {
            divforres = div;
            rem = numberchange % div;
            divforres /= 10;
            while(divforres > 0)
            {
                res = rem / divforres;
                printf("%d", res);
                rem %= divforres;
                divforres /= 10;
            }
            printf(" + ");
        }
        printf("%d = ", numberinput);
        
        //Compute Sum
        
        for(; div > 0 ; div /= 10)
        {
            sum = sum + (numberinput % div);
        }
        printf("%d", sum);
        
        printf("\n\nEnter an integer >=0: ");
        scanf("%d", &numberinput);
    }
    return 0;
}

