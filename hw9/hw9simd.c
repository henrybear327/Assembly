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

    double inp[SIZE][SIZE] __attribute__((aligned(32))); // 8-byte = 32-bit
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            scanf("%lf", &inp[i][j]);
        }
    }

    double ans[SIZE];
    memset(ans, 0, sizeof(ans));

    for (int i = 0; i < SIZE; i++) { // first term counter
        double sum[4];
        memset(sum, 0, sizeof(sum));
        __m128d *mm_sum = (__m128d *)sum;
        for (int j = 0; j < SIZE; j++) { // second term counter
            __m128d *row1 = (__m128d *)inp[i];
            __m128d *row2 = (__m128d *)inp[j];

            for (int k = 0; k < SIZE / 4; k++) { // calculate the dot product
                double tmp[4];
                memset(tmp, 0, sizeof(tmp));
                __m128d *mm_tmp = (__m128d *)tmp;

                *mm_tmp = _mm_mul_pd(row1[k], row2[k]);

                *mm_sum = _mm_add_pd(*mm_tmp, *mm_sum);
            }
        }
        printf("%f\n", sum[0] + sum[1] + sum[2] + sum[3]);
    }

    /*
    for (int i = 0; i < SIZE; i++) {     // first term counter
        for (int j = 0; j < SIZE; j++) {   // second term counter
            for (int k = 0; k < SIZE; k++) { // calculate the dot product
                ans[i] += inp[i][k] * inp[j][k];
                // printf("%f\n", ans[i]);
            }
        }
        printf("%f\n", ans[i]);
    }
    */

    return 0;
}