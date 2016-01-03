#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*
clang-format -i -style=LLVM generator.c  && astyle --style=linux generator.c  &&
clang -Wall -Wextra -Werror -o generator.o generator.c
*/

#define SIZE 200

int main()
{
    srand(time(NULL));

    freopen("data.txt", "w", stdout);

    /*
        Generate numbers that's between 0 and 999,
        and divide then with a random number between 1 and 100
    */

    for (int i = 0; i < SIZE; i++)
        for (int j = 0; j < SIZE; j++)
            printf("%f%c", (double)(rand() % 1000) / (rand() % 100 + 1),
                   j == SIZE - 1 ? '\n' : ' ');

    return 0;
}