#include <stdio.h>
#include <string.h>

#include "mmintrin.h" // Definitions and Declarations for use with compiler intrinsics
#include "xmmintrin.h" // SSE
#include "emmintrin.h" // SSE2
/*
__m128d _mm_mul_pd (__m128d a, __m128d b)
__m128d _mm_add_pd (__m128d a, __m128d b)
*/

#define SIZE 200

int main()
{
    // freopen("sample_data.txt", "r", stdin); // SIZE needs to be 4

    freopen("data.txt", "r", stdin);
    freopen("output.txt", "w", stdout);

    double inp[SIZE][SIZE] __attribute__((aligned(64)));
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
        printf("%f\n", ans[i]);
    }

    return 0;
}