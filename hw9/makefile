all:
	gcc -std=c99 -Wall -Wextra  -o hw9.o hw9.c
	gcc -Wall -Wextra -msse -msse2 -ftree-vectorize -std=c99 -o hw9simd.o hw9simd.c
	gcc -std=c99 -Wall -Wextra -Werror -o generator.o generator.c
	@/bin/echo -n "The first and second timer is for hw9.o and hw9simd.o respectively."
	@time ./hw9.o && time ./hw9simd.o

non_simd: hw9.c
	gcc -std=c99 -Wall -Wextra  -o hw9.o hw9.c
simd: hw9simd.c
	gcc -Wall -Wextra -msse -msse2 -ftree-vectorize -std=c99 -o hw9simd.o hw9simd.c
generator: generator.c
	gcc -std=c99 -Wall -Wextra -Werror -o generator.o generator.c
clean:
	rm -f *.o *.c.orig 
