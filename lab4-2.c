#include <stdio.h>
#include <stdlib.h>

int main()
{
    int number = 0, i = 2, rem = 0, k = 0, temp = 0, newnumber = 0;
    printf("Please input a number: ");
    scanf("%d", &number);
    newnumber = number;
    if(number == 1) printf("1");
    else
    {
    while(i <= number)
    {
        rem = newnumber % i;
        if( rem == 0 )
        {
            for(k = 1; rem == 0 ; )
            {
                newnumber = newnumber / i;
                rem = newnumber % i;
                //printf("num:%d\n", newnumber);

                if(rem == 0)
                {
                    k++;
                }
                else
                {
                    rem = 1;
                }
            }
            //printf("k:%d\n", k);
            //printf("i:%d\n", i);

            if (k == 1)
                printf("%d", i);
            else if (k > 1)
            {
                printf("%d ^ %d", i, k);
            }
            if(newnumber > 1)
            {
                printf(" * ");
            }

        }
        i++;


    }
    }

}
