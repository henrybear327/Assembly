#include <stdio.h>
#include <string.h>

#include "mmintrin.h" // Definitions and Declarations for use with compiler intrinsics
#include "xmmintrin.h" // SSE
#include "emmintrin.h" // SSE2
/*
__m128d _mm_mul_pd (__m128d a, __m128d b)
__m128d _mm_add_pd (__m128d a, __m128d b)
*/

/*
clang-format -i -style=LLVM hw9simd.c  && astyle --style=linux hw9simd.c
&& gcc -Wall -Wextra -msse -msse2 -ftree-vectorize -std=c99 -o hw9simd.o
hw9simd.c
*/

#define SIZE 200

int main()
{
    // freopen("sample_data.txt", "r", stdin); // SIZE needs to be 4

    freopen("data.txt", "r", stdin);
    freopen("output.txt", "w", stdout);

    double inp[SIZE][SIZE] __attribute__((aligned(64))); // 8-byte = 64-bit
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            scanf("%lf", &inp[i][j]);
        }
    }

    for (int i = 0; i < SIZE; i++) { // first term counter
        double sum[2] __attribute__((aligned(64)));
        memset(sum, 0, sizeof(sum));
        __m128d *mm_sum = (__m128d *)sum;
        for (int j = 0; j < SIZE; j++) { // second term counter
            __m128d *row1 = (__m128d *)inp[i];
            __m128d *row2 = (__m128d *)inp[j];

            for (int k = 0; k < SIZE / 2; k++) { // calculate the dot product
                double tmp[2] __attribute__((aligned(64)));
                memset(tmp, 0, sizeof(tmp));
                __m128d *mm_tmp = (__m128d *)tmp;

                *mm_tmp = _mm_mul_pd(row1[k], row2[k]);

                *mm_sum = _mm_add_pd(*mm_tmp, *mm_sum);
                // printf("%d %d %d: %f %f\n", i, j, k, sum[0], sum[1]);
            }
        }

        // output to only 3 dicimal digits to avoid rounding errors
        printf("%.3f\n", sum[0] + sum[1]);
    }

    return 0;
}