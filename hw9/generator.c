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
    for (int i = 0; i < SIZE; i++)
        for (int j = 0; j < SIZE; j++)
            printf("%f%c", (double)(rand() % 1000) / (rand() % 100 + 1),
                   j == SIZE - 1 ? '\n' : ' ');

    return 0;
}