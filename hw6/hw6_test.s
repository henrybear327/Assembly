/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- Orig array --- */
	.size orig, 20
orig:
	.word 1
	.word 3
	.word 5
	.word 2
	.word 4

/* --- Ans array --- */
	.size ans, 20
ans:
	.word 1
	.word 3
	.word 5
	.word 2
	.word 4

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function

.answer:
	@ size 20
	.word ans

main:
	MOV ip, sp
	STMFD sp!, {fp, ip, lr, pc}
	SUB fp, ip, #4

	/* --- begin of your function --- */
	LDR r0, .answer
	LDR r8, .answer
	MOV r1, #5 /* array size */
	STR r0, [sp, #-4]!	/* push array address */
	STR r1, [sp, #-4]!	/* push array size */

	bl NumSort
	/* --- end of your function --- */

	LDMEA fp, {fp, sp, pc}
	nop
	.end
