//
//  main.c
//  lab6-4hw
//
//  Created by Apple on 2015/11/8.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
int main(void)
{
    char text[100], start[10], end[10];
    int textlength = 0, startlength = 0, endlength = 0, i = 0;
    int checklength = 0, ps = 0, pn = 0, d = 0, e = 0;
    
    printf("type text:");
    scanf("%s",text);
    printf("type start:");
    scanf("%s",start);
    printf("type end:");
    scanf("%s",end);
    
    for(i = 0;i < 100;i++)
    {
        if(text[i] == '\0') break;
        textlength++;
    }
    text[textlength] = 'z';
    for(i = 0;i < 100;i++)
    {
        if(start[i] == '\0') break;
        startlength++;
    }
    for(i = 0;i < 100;i++)
    {
        if(end[i] == '\0') break;
        endlength++;
    }
    for(i = 0;i < 100;i++)
    {
        if(text[i] == start[0])
        {
            for(checklength = 1; checklength < 10;checklength++)
            {
                if(text[i+checklength] != start[checklength]) break;
            }
        }
        if(checklength == startlength) //start find
        {
            ps = i;
            //printf("ps%d", ps);
            d = i + checklength;
            for(;d < 100;d++)
            {
                if(text[d] == end[0])
                {
                    for(checklength = 1; checklength < 10;checklength++)
                    {
                        if(text[d+checklength] != end[checklength]) break;
                    }
                }
                //i++;
                //pn = i;
                //printf("end%d", pn);
                if(checklength == endlength)
                {
                    pn = d;
                    //printf("pn%d check:%d end:%d", pn, checklength, endlength);
                    i = ps;
                    for(e = ps;e < pn + checklength;e++)
                    {
                        printf("%c", text[e]);
                    }
                    printf("\n");
                }
                checklength = 1;
            }
        }
        
    }
    
    return 0;
}

