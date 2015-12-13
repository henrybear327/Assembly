all: call_numsort.c Numsort.s
	arm-elf-gcc -std=c99 -Wall -Wextra -g -o main.o call_numsort.c Numsort.s
clean:
	rm -f *.exe *.o
