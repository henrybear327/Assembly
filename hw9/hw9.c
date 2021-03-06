#include <stdio.h>
#include <string.h>

#define SIZE 200

/*
lang-format -i -style=LLVM hw9.c  && astyle --style=linux hw9.c
&& clang -Wall -Wextra  -o hw9.o hw9.c
*/

int main()
{
    // freopen("sample_data.txt", "r", stdin); // SIZE needs to be 4

    freopen("data.txt", "r", stdin);
    freopen("output_non_SIMD.txt", "w", stdout);

    double inp[SIZE][SIZE];
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            scanf("%lf", &inp[i][j]);
        }
    }

    double ans[SIZE];
    memset(ans, 0, sizeof(ans));

    for (int i = 0; i < SIZE; i++) {     // first term counter
        for (int j = 0; j < SIZE; j++) {   // second term counter
            for (int k = 0; k < SIZE; k++) { // calculate the dot product
                ans[i] += inp[i][k] * inp[j][k];
                // printf("%f\n", ans[i]);
            }
        }

        // output to only 3 dicimal digits to avoid rounding errors
        printf("%.3f\n", ans[i]);
    }

    return 0;
}