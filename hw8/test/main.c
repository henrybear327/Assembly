#include <stdio.h>

void do_shit(int n)
{
    do_shit(3);
}

int main()
{
    do_shit(3);
    printf("%d\n", 3);

    return 0;
}
