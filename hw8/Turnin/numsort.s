/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- result array --- */
	.size result, 20
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
	STMFD sp!, {r1-r10, fp, ip, lr, pc} @ store the r0-r15 status
	SUB fp, ip, #4

	ldr r10, =result
	str r0, [r10]
	str r1, [r10, #4]

	@ .result now has r0, r1

	mov r1, #4
	mov r2, r0
	mul r0, r1, r2

	bl malloc

	mov r9, r0 @ r9 = result array

	ldr r10, =result
	ldr r0, [r10]
	ldr r1, [r10, #4]

	/*
	r0 is now the size of the array
	r1 is now the pointer to the passed-in array
	*/

	/* --- begin your function --- */

	/* DO NumSort */
	/*
	for(int i = 0; i < r5; i++)
		for(int j = i + 1; j < r5; j++)
			if(array[i] > array[j])
				swap(array[i], array[j]);
	*/

	/*
	r0 orig_size
	r1 orig_array

	r2 i
	r3 j
	r4 size_limit

	r5 orig_array[i]
	r6 orig_array[j]
	r7 tmp

	r9 result array
	*/

	MOV r2, #4
	MUL r4, r2, r0 @ set size_limit
	MOV r2, #0 @ init i = 0

	/* Copy orig_array to result array*/
	/*
	for(int i = 0; i < size_limit;i++)
		result[i] = orig_array[i];
	*/
COPY:
	CMP r2, r4
	BEQ END_COPY
	LDR r7, [r1, r2]
	STR r7, [r9, r2]
	ADD r2, #4
	B COPY

END_COPY:
	MOV r1, r9 @ Do all operations on result array!
	MOV r2, #0 @ init i = 0

I_LOOP:
	CMP r2, r4 @ i < size_limit
	BEQ TERMINATE

	MOV r3, r2
	ADD r3, #4 @ j = i + 1
J_LOOP:
	CMP r3, r4 @ j < size_limit
	BEQ END_J

	@ if(orig_array[i] > orig_array[j])
	@ 	swap(orig_array[i], orig_array[j]);
	LDR r5, [r1, r2]
	LDR r6, [r1, r3]
	CMP r5, r6
	MOVPL r7, r5
	MOVPL r5, r6
	MOVPL r6, r7
	STRPL r5, [r1, r2]
	STRPL r6, [r1, r3]

	ADD r3, #4
	B J_LOOP
END_J:
	ADD r2, #4
	B I_LOOP

TERMINATE:
	/* --- end of your function --- */
	MOV r0, r1
	/* function exit */
	LDMEA fp, {r1-r10, fp, sp, pc}
	.end
