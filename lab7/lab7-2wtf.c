//
//  main.c
//  lab7-2
//
//  Created by Apple on 2015/11/10.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#include <stdio.h>
#include <stdbool.h>

int main(void)
{
    bool die = false;
    int dead = 0;
    int people[100] = {0};
    int i = 0, countdown = 0;
    int N = 0, K = 0, A = 0;
    printf("(N,K,A)=");

    scanf("%d ,%d , %d", &N, &K, &A);

    for(i = 1; i <= N; i++)
        people[i] = i;
    //for(i = 1; people[i] == 103; i++); printf("%d", i);

    i = 1;
    dead = 100;
    //printf("0:%d -", people[0]);

    for(;dead > 0;dead--)
    {
        for(countdown = K;countdown > 0;countdown--,i++)
        {
            if(i > N) i -= N;
            while(people[i] == die) i++;
            if(i > N) i -= N;
            if(countdown == 1)
            {
                people[i] = die;
                printf("%d ", i);
            
            }
        }
    
    }
    ;dead = N - A;
    while(A > 0)
    {
        if(i > N) i-=N;
        if(people[i] != die) printf("last %d die is %d\n", A--, i++);
    }
    return 0;
}

