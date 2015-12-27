#include <stdio.h>
#include <stdlib.h>

extern int *NumSort(int size, int array[]);
extern int FileOutput(char *str);

int main()
{
    int n;
    scanf("%d", &n);

    int array[n];

    for(int i = 0; i < n; i++)
        scanf("%d", &array[i]);

    int *result = NumSort(n, array);

    // get number string in reverse order
    char string[1000] = {0};
    int idx = 0;
    for(int i = n - 1; i >= 0; i--) {
        int curr = result[i];
        while(curr) {
            string[idx++] = (curr % 10) + '0';
            curr /= 10;
        }
        if(i)
            string[idx++] = ' ';
    }

    //reverse the number string
    int l = 0, r = idx - 1;
    while(l < r) {
        char tmp = string[l];
        string[l] = string[r];
        string[r] = tmp;
        l++;
        r--;
    }

    for(int i= 0; i < idx; i++)
        printf("%c", string[i]);
    printf("\n");

    int error_code = FileOutput(string);
    if(error_code == 0)
        printf("File created successfully\n");
    else
        printf("File creation failed. Error code %d\n", error_code);

    for(int i = 0; i < n; i++)
        printf("%d%c", result[i], i == n - 1 ? '\n' : ' ');

    return 0;
}
