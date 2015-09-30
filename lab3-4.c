#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    int abcd = 0, efgh = 0, ijkl = 0, mnop = 0;
    
    scanf("%d.%d", &abcd, &efgh);
    scanf("%d.%d", &ijkl, &mnop);
    
    printf("sum: %d\n", abcd + ijkl);
    int sum = abcd + ijkl;
    
    printf("sub: %d\n", efgh - mnop);
    int sub = efgh - mnop;
    
    int cd = abcd % 100, ef = efgh / 100;
    int cdef = cd * 100 + ef;
    int kl = ijkl % 100, mn = mnop / 100;
    int klmn = kl * 100 + mn;
    printf("mul: %d\n", cdef * klmn);
    int mul = cdef * klmn;
    
    float ab = abcd / 100, gh = efgh % 100;
    float abgh = ab * 100 + gh;
    float ij = ijkl / 100, op = mnop % 100;
    int ijop = ij * 100 + op;
    float div = abgh / ijop;
    int divint = div * 100 + 0.5;
    double divround = divint / 100.;
    printf("div: %.2f\n\n", divround);
    
    printf("Encoding Result %.2f\n", sum + sub + mul + divround);
    
    return 0;
}

