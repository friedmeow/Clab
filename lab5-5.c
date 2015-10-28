#include <stdlib.h>
#include <stdio.h>

int main(void)
{

    int n = 0, i = 0, m = 0, k = 0, one = 0;
    scanf("%d", &n);
    int number[n];
    
    for(i = 0; i < n; i++)
        scanf("%d", &number[i]);
    printf("\n");
    
    //Eg 5
    //0 1 2 3 4
    //4 3 2 1
    //1 2 3
    //3 2
    //2
    
    for(m = n; m >= k;)
    {
        for(; k < m; k++)
            printf("%d ", number[k]);
        printf("\n");
        m--;
        k = 0;
        one += 1;
        k += one;
        for(i = m; i >= k; i--)
            printf("%d ", number[i]);
        printf("\n");

    }
    return 0;
}

