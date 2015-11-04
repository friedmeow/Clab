#include <stdio.h>
#include <stdlib.h>

int main()
{
    int len, form, i, tp = 1, j;
    scanf("%d %d", &len, &form);
    int arr[20][20] = {0};
    int k = 0, m = len, l = 0, n = len;

    if(form == 1)
    {
        while(k < m && l < n)
        {
            for(i = l; i < n; ++i, ++tp)    ///upper row
            {
                arr[k][i] = tp;
            }
            k++;

            for(i = k; i < m; ++i, ++tp)            ///right column
            {
                arr[i][n - 1] = tp;
            }
            n--;

            if(l < n)                               ///bottom row
            {
                for(i = n - 1; i >= l; --i, ++tp)
                {
                    arr[m - 1][i] = tp;
                }
                m--;
            }

            if(m > k)                               ///left column
            {
                for(i = m - 1; i >= k; --i, ++tp)
                {
                    arr[i][l] = tp;
                }
                l++;
            }
        }
    }

    else if(form == 2)
    {
        while(k < m && l < n)
        {
            for(i = k; i < m; ++i, ++tp)    ///left col
            {
                arr[i][l] = tp;
            }
            l++;

            for(i = l; i < n; ++i, ++tp)            ///bottom
            {
                arr[m - 1][i] = tp;
            }
            m--;

            if(m > k)                               ///right col
            {
                for(i = m - 1; i >= k; --i, ++tp)
                {
                    arr[i][n - 1] = tp;
                }
                n--;
            }

            if(l < n)                               ///left column
            {
                for(i = n - 1; i >= l; --i, ++tp)
                {
                    arr[k][i] = tp;
                }
                k++;
            }
        }
    }

    for(i = 0; i < len; ++i)
    {
        for(j = 0; j < len; ++j)
        {
            printf("%5d", arr[i][j]);
        }
        printf("\n");
    }

    return 0;
}
