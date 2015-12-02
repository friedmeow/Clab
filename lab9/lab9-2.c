#include <stdlib.h>
#include <stdbool.h>
#include <stdio.h>

int main(void)
{
    int count = 0, a_po = 0, b_po = 0;
    printf("Please input stone Count:");
    scanf("%d", &count);
    printf("Please input Alice Position:");
    scanf("%d", &a_po);
    printf("Please input Bob position:");
    scanf("%d", &b_po);
    
    // a_po + 2x = b_po + 3y
    // a_po + 2x = b_po - 3y
    // a_po - 2x = b_po + 3y
    // a_po - 2x = b_po - 3y
    
    int x = 0, y = 0;
    int a_n_po = 0, b_n_po = 0;
    int match = false;
    int a_time = 0, b_time = 0;
    a_n_po = a_po;
    for(x = 1; a_n_po < count; x++)
    {
        for(y = 1, b_n_po = b_po; b_n_po < count; y++)
        {
            if(a_n_po == b_n_po)
            {
                match = true;
                goto match;
            }
            b_n_po = b_po + 3 * y;

        }
        a_n_po = a_po + 2 * x;
    }
    a_n_po = a_po;
    for(x = 1; a_n_po < count; x++)
    {
        for(y = 1, b_n_po = b_po; b_n_po >= 0; y++)
        {
            if(a_n_po == b_n_po)
            {
                match = true;
                goto match;
            }
            b_n_po = b_po - 3 * y;
            
        }
        a_n_po = a_po + 2 * x;
    }
    a_n_po = a_po;
    for(x = 1; a_n_po >= 0; x++)
    {
        for(y = 1, b_n_po = b_po; b_n_po < count; y++)
        {
            if(a_n_po == b_n_po)
            {
                match = true;
                goto match;
            }
            b_n_po = b_po + 3 * y;
            
        }
        a_n_po = a_po - 2 * x;
    }
    a_n_po = a_po;
    for(x = 1; a_n_po >= 0; x++)
    {
        for(y = 1, b_n_po = b_po; b_n_po >= 0; y++)
        {
            if(a_n_po == b_n_po)
            {
                match = true;
                goto match;
            }
            b_n_po = b_po - 3 * y;
            
        }
        a_n_po = a_po - 2 * x;
    }
    
match:
    a_time = (a_n_po - a_po) / 2;
    b_time = (b_n_po - b_po) / 2;

    if(match)
    {
        printf("They will meet at stone %d\n", b_n_po);
        if(a_time == 0) printf("Alice does not need to jump\n");
        else if(a_time > 0) printf("Alice need to jump right %d times\n", a_time);
        else printf("Alice need to jump left %d times\n", a_time * -1);
        if(b_time == 0) printf("Bob does not need to jump\n");
        else if (b_time < 0) printf("Bob need to jump left %d times\n", b_time * -1);
        else printf("Bob need to jump right %d times\n", b_time);
    }
    else printf("They will never meet");
    return 0;
}

