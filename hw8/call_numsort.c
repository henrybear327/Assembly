#include <stdio.h>
#include <stdlib.h>

extern int *NumSort(int size, int array[]);

int main()
{
    int n;
    scanf("%d", &n);

    int array[n];

    for(int i = 0; i < n; i++)
        scanf("%d", &array[i]);

    int *result = NumSort(n, array);

    for(int i = 0; i < n; i++)
        printf("%d%c", result[i], i == n - 1 ? '\n' : ' ');

    return 0;
}
