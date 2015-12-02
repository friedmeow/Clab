#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int perm(int string[], int start, int end, int MAX[], int MIN[]);
void swap(int *a, int *b);

int main()
{
    int count = 0;
    int MAX[3], MIN[3];
    int string[100];
    int num_stick = 0;
    printf("The number of sticks:");
    scanf("%d", &num_stick);
    for(int i = 0; i < num_stick; i++)
    {
        scanf("%d", &string[i]);
    }
    count = perm(string, 0, num_stick - 1, MAX, MIN);
    printf("\nYou can combine %d triangles.\n", count);
    printf("Three sides of the Max triangle: %d,%d,%d\n", MAX[0], MAX[1], MAX[2]);
    printf("Three sides of the Min triangle: %d,%d,%d\n", MIN[0], MIN[1], MIN[2]);
    return 0;

}

void swap(int *a, int *b)
{
    int temp = 0;
    temp = *a;
    *a = *b;
    *b = temp;
}

int perm(int string[], int start, int end, int MAX[], int MIN[])
{
    static int count = 0;
    int i = 0;
    static int max = 0, min = 100;
    if(start == end)
    {
        if( string[0] + string[1] > string[2] && string[0] + string[2] > string[1] && string[2] + string[1] > string[0])
        {
            static int numbers[100] = {0};
            int sum = 0;
            sum = string[0] + string[1] + string[2];

            if(numbers[sum] == false)
            {
                printf("Three sides of this triangle: ");
                for(int j = 0; j <= 2; j++)
                {
                    printf("%d", string[j]);
                    if(j != 2) printf(",");
        
                }
                printf("\n");
                count++;

            }
            int s = sum / 2;
            
             if(sqrt(s*(s-string[0])*(s-string[1])*(s-string[2])) > max)
             {
             max = sqrt(s*(s-string[0])*(s-string[1])*(s-string[2]));
             MAX[0] = string[0], MAX[1] = string[1], MAX[2] = string[2];
             }
             if(sqrt(s*(s-string[0])*(s-string[1])*(s-string[2])) < min)
             {
             min = sqrt(s*(s-string[0])*(s-string[1])*(s-string[2]));
             MIN[0] = string[0], MIN[1] = string[1], MIN[2] = string[2];
             
             }
             
            numbers[sum] = true;
        }
    }
    else
    {
        for(i = start; i <= end; i++)
        {
            swap((string + start), (string + i));
            perm(string, start + 1, end, MAX, MIN);
            swap((string + i), (string + start));
        
        }
        return count;
        //printf("\nYou can combine %d triangles.\n", count);
        //printf("Three sides of the Max triangle: %d,%d,%d\n", MAX[0], MAX[1], MAX[]);
        //printf("Three sides of the Min triangle: %d,%d,%d\n", MIN[0], MIN[1], MIN[2]);


    }


}
