#include <stdio.h>
#include <stdlib.h>

extern int *NumSort(int size, int array[]);

/*
int *NumSort(int size, int array[])
{
    int i, j;
    for(i = 0; i < size; i++) {
	for(j = i + 1; j < size; j++)  {
	    if(array[i] > array[j]) {
		int tmp = array[j];
		array[j] = array[i];
		array[i] = tmp;
	    }
	}
	result[i] = array[i];
    }
    return result;
}
*/

int main()
{
    int n;

    scanf("%d", &n);

    int array[n];
    for(int i = 0; i < n; i++)
	   scanf("%d", &array[i]);

    int *result = NumSort(n, array);

    int i;
    for(i = 0; i < n; i++)
	printf("%d%c", result[i], i == n - 1 ? '\n' : ' ');

    return 0;
}
