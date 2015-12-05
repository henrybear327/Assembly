	.section .text
	.global NumSort
	.type NumSort,%function

NumSort:
	/* function start */
	MOV ip, sp
	STMFD sp!, {r0-r10, fp, ip, lr, pc}
	SUB fp, ip, #4

	/* --- begin your function --- */

	LDR r5, [ip], #4 /* get array size */
	LDR r6, [ip], #4 /* get array address */

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
	r5 array size
	r6 array addr.
	*/
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

	nop
	/* function exit */
	LDMEA fp, {r0-r10, fp, sp, pc}
	.end
