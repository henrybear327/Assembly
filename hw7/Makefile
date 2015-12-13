all: call_numsort.c numsort.s
	arm-elf-gcc -std=c99 -Wall -Wextra -g -o call_numsort.exe call_numsort.c numsort.s
clean:
	rm -f *.exe *.o
