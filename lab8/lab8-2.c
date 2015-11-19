#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void push(char);
char pop(void);
bool empty(void);
bool full(void);
void fail(void);
char stack[100];
int top = 0;
int main()
{
    char ch, a[100];
    int i = 0, count = 0;
    printf("Please use '(' and ')' to mark reverse area, your input:\n");
    do{
        ch = getchar();
        if(ch != ')')
        {
            push(ch);
            if(ch != '(') count++;
        }
        else if(ch == ')')
        {
            i = 0;
            for(;;)
            {
                a[i] = pop();
                if(a[i] == '(') break;
                i++;

            }
            for(i = 0; a[i] != '('; i++)
            {
                if(a[i] == '(') break;
                push(a[i]);
            }
        }
    } while(ch != '\n');

    for(i = 0; count > 0;count--, i++)
    {
        printf("%c",stack[i]);
    }
    
    return 0;
}

void push(char ch)
{
    if(full())
        fail();
    else stack[top++] = ch;
}
char pop(void)
{
    if(empty())
        fail();
    else return stack[--top];
}
bool empty(void)
{
    return top == 0;
}
bool full(void)
{
    return top == 100;
}
void fail(void)
{
    exit(EXIT_FAILURE);
}
