/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- result array --- */
	.size orig, 20
result:
	.word 0
	.word 0
	.word 0
	.word 0
	.word 0

    .section .text
    .global NumSort
    .type NumSort,%function
NumSort:
	/* function start */
	MOV ip, sp @ ip is now the position before the stack pointer moved
	STMFD sp!, {r2-r10, fp, ip, lr, pc} @ store the r0-r15 status 
	SUB fp, ip, #4 

	/*
	r0 is now the size of the array
	r1 is now the pointer to the passed-in array
	r12 is now the starting point of the original r0-r15
	*/

	/* --- begin your function --- */

	/* DO NumSort */
	/*
	for(int i = 0; i < r5; i++)
		for(int j = i + 1; j < r5; j++)
			if(array[i] > array[j]) //r0, r1
				swap(array[i], array[j]);
	*/

	/*
	i r0
	j r1
	limit r4
	array[i] r2
	array[j] r3
	r5 array size -> r0
	r6 array addr. -> r1
	*/
	MOV r5, r0
	MOV r6, r1

	MOV r0, #0 		@init i
	MOV r4, #0
	MOV r7, #4
	MUL r4, r5, r7
	SUB r4, r4, #4

LOOP_i:
	MOV r2, #0
	LDR r2, [r6, r0] @get array[i]

	ADD r1, r0, #4
	ADD r7, r4, #4
	CMP r1, r7
	BNE LOOP_j

BACK_TO_i:
	CMP r0, r4
	BEQ TERMINATE @i == r5
	ADD r0, r0, #4 @ i++
	B LOOP_i

LOOP_j:
BACK_TO_j:
	LDR r3, [r6, r1] @get array[j]
	CMP r2, r3;
	MOVPL r8, r2 @swap
	MOVPL r2, r3
	MOVPL r3, r8
	STR r2, [r6, r0] @store it back
	STR r3, [r6, r1]

	CMP r1, r4
	BEQ BACK_TO_i
	ADD r1, r1, #4

	B BACK_TO_j


TERMINATE:
	/* --- end of your function --- */
	MOV r0, r6
	nop
	/* function exit */
	LDMEA fp, {r2-r10, fp, sp, pc}
	.end
