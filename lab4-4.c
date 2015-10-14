#include <stdio.h>
#include <stdlib.h>

int main()
{
    int O = 0, A = 0, X = 0, B = 0;
    int C = 0, D = 0, E = 0, F = 0;
    int VP = 0, V = 0;

    printf("type the answer:");
    scanf("%1d%1d%1d%1d", &O, &A, &X, &B);
    printf("What's your input number?\n");
    for(; VP != 4 ||  V != 0;)
    {
    scanf("%1d%1d%1d%1d", &C, &D, &E, &F);
    V = 0, VP = 0;
    if( C == O ) VP++;
    else if( C == A ) V++;
    else if( C == X ) V++;
    else if( C == B ) V++;


    if( D == O ) V++;
    else if( D == A ) VP++;
    else if( D == X ) V++;
    else if( D == B ) V++;

    if( E == O ) V++;
    else if( E == A ) V++;
    else if( E == X ) VP++;
    else if( E == B ) V++;


    if( F == O ) V++;
    else if( F == A ) V++;
    else if( F == X ) V++;
    else if( F == B ) VP++;


    printf("%dA%dB!!\n", VP, V);
    if(VP != 4 || V != 0)
    printf("What's your input number?\n");

    if(VP == 4 && V == 0)
    {
        printf("You win this game!!");
        break;
    }

    }

}
