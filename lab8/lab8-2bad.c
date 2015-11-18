#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main()
{
    char a[100], tempch;
    int lc = 0, rc = 0, i = 0;
    int l_count = 0, r_count = 0;
    printf("Please us '(' and ')' to mark reverse area, your input:\n");
    scanf("%s", a);
    while(a[rc+1]!='\0')
    {
    for(i = 0; i < 100; i++)
    {
        if(a[i] == '(') lc = i;
        if(a[i] == ')')
        {
            rc = i;
            a[rc] = false;
            a[lc] = false;
            break;
        }
    }
    for(r_count = rc - 1, l_count = lc + 1; r_count >= l_count; r_count--)
    {
        tempch = a[l_count];
        a[l_count] = a[r_count];
        a[r_count] = tempch;
        l_count++;
    }
    }

    for(i = 0; i < 10;i++)
    {
        if(a[i] == ')' || a[i] == '(');
        else printf("%c",a[i]);

    }

}
