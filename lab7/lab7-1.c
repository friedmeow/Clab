#include <stdio.h>
int excandy(int wrappers);
int main(int argc, const char * argv[])
{
    int candy = 0, wrappers = 0;
    printf("Please input money:");
    scanf("%d", &candy);
    wrappers = candy;
    printf("You can get %d candies", candy + excandy(wrappers));
    return 0;
}
int excandy(int wrappers)
{
    if(wrappers < 3 ) return 0;
    else return (wrappers / 3) + excandy(wrappers / 3 + wrappers % 3) ;

}
