#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>


int main()
{
    char string[100];
    int i = 0, count = 0, i_temp = 0, find = false;
    int count_1 = 0, count_2 = 0, count_3 = 0, count_4 = 0;
    scanf("%s", string);
    while(string[i] != '\0')
    {
        if(string[i] == ']')
        {
            count_1++;
            i_temp = i;
            for(; i_temp >= 0 ; i_temp--)
            {
                if(string[i_temp] == '[')
                {
                    find = true;
                    break;
                }
                if(string[i_temp] == '{' || string[i_temp] == '}') goto Invalid;
            }
            if(!find) goto Invalid;
            find = false;
        }
        else if(string[i] == '[') count_1++;
        else if(string[i] == '}')
        {
            count_2++;
            i_temp = i;
            for(; i_temp >= 0 ; i_temp--)
            {
                if(string[i_temp] == '{')
                {
                    find = true;
                    break;
                }
            }
            if(!find) goto Invalid;
            find = false;
        }
        else if(string[i] == '{') count_2++;
        else if(string[i] == ')')
        {
            count_3++;
            i_temp = i;
            for(; i_temp >= 0 ; i_temp--)
            {
                if(string[i_temp] == '(')
                {
                    find = true;
                    break;
                }
                if(string[i_temp] == '{' || string[i_temp] == '}' || string[i_temp] == '[' || string[i_temp] == ']' ) goto Invalid;
            }
            if(!find) goto Invalid;
            find = false;

        }
        else if(string[i] == '(') count_3++;
        else if(string[i] == '>')
        {
            count_4++;
            i_temp = i;
            for(; i_temp >= 0 ; i_temp--)
            {
                if(string[i_temp] == '<')
                {
                    find = true;
                    break;
                }
                if(string[i_temp] == '{' || string[i_temp] == '}' || string[i_temp] == '[' || string[i_temp] == ']' || string[i_temp] == '(' || string[i_temp] == ')') goto Invalid;
            }
            if(!find) goto Invalid;
            find = false;
        }
        else if(string[i] == '<') count_4++;

        i++, count++;

    }

    if(count_1 % 2 || count_2 % 2 ||count_3 % 2 ||count_4 % 2) goto Invalid;
    
    printf("Valid!");
    goto End;

Invalid:
    printf("Invalid!");
           
End:
    return 0;
}

