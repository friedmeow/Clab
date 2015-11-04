#include <stdio.h>
#include <stdlib.h>

int cal(int mon);

int main()
{
    int money, candy = 0, bonus = 0;
    printf("input $:");
    scanf("%d", &money);
    int wrap = money;
    candy = money + calculate(wrap, bonus);

    printf("you can get %d candies", candy);

    return 0;
}

int calculate(int wrap, int bonus)
{
    bonus += wrap / 3;
    //wrap %= 3;
    if((wrap%3 + (wrap/3)) < 3)
        return bonus;
    else
        return calculate((wrap%3 + (wrap/3)), bonus);
}
