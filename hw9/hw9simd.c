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
    // freopen("output.txt", "w", stdout);

    double inp[SIZE][SIZE] __attribute__((aligned(32)));
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            scanf("%lf", &inp[i][j]);
        }
    }

    double ans[SIZE], sum[2];
    memset(ans, 0, sizeof(ans));

    __m128d **mm_inp, *mm_ans, *mm_sum;
    mm_inp = (__m128d **)inp;
    mm_ans = (__m128d *)ans;
    mm_sum = (__m128d *)sum;

    printf("Start!\n");

    for (int i = 0; i < SIZE; i++) { // first term counter
        memset(sum, 0, sizeof(sum));
        for (int j = 0; j < SIZE; j++) {       // second term counter
            for (int k = 0; k < SIZE / 2; k++) { // calculate the dot product
                double tmp[2] = {0.0};
                __m128d *mm_tmp = (__m128d *)tmp;
                printf("Oops!\n");
                *mm_tmp = _mm_mul_pd(mm_inp + i * SIZE + k, mm_inp + j * SIZE + k);
                printf("Oops!\n");
                *mm_sum = _mm_add_pd(mm_sum[0], mm_tmp[0]);
                printf("Oops!\n");
                printf("%f\n", sum[0] + sum[1]);
            }
        }
        printf("%f\n", sum[0] + sum[1]);
    }

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