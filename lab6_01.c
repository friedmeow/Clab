#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i = 0, p1 = 0, p2 = 0, j= 0;
    char arr[100] = {0};
    scanf("%s", &arr);

    for (i = 0; i < 50; ++i)
    {
        if(arr[i] >= '0' && arr[i] <= '9')          ///encounter number
        {
            p2 = i - 1;
            for(; p2 >= p1; p2--)
                printf("%c", arr[p2]);
            printf("_");
            p1 = i+1;
        }

        else if(arr[i] == '\0')
            for(; p1 < i; p1++)
                printf("%c", arr[p1]);
    }
    return 0;
}
