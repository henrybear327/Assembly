/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- Matrix A --- */
	.size a1, 12
a1:
	.word 1
	.word 2
	.word 3

	.size a2, 12
a2:
	.word 4
	.word 5
	.word 6

/* --- Matrix B --- */
	.size b1, 12
b1:
	.word 7
	.word 9
	.word 11

	.size b2, 12
b2:
	.word 8
	.word 10
	.word 12

/* --- Matrix C --- */
	.size c1, 8
c1:
	.word 13
	.word 14

	.size c2, 8
c2:
	.word 15
	.word 16


/* --- Matrix D --- */
	.size d1, 8
d1:
	.word 0
	.word 0

	.size d2, 8
d2:
	.word 0
	.word 0

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main, %function


@Kind of get the pointer to point to the start of the requested memory address
.matrix:
	@ size 12
	.word a1
	.word a2
	.word b1
	.word b2
	@ size 8
	.word c1
	.word c2
	.word d1
	.word d2

main:
	/*==================================================*/
	@ Kind of get the pointer to point to the start of the requested memory address
	@ r0 is always the pointer to the memory address in this code
	ldr r0, .matrix

	@ calculate answer for D[0][0]

	@ Load row 0 from A to r1-r3
	ldmia r0, {r1 - r3}

	@ Load column 0 from B to r4-r6
	add r0, r0, #24
	ldmia r0, {r4 - r6}

	@ Load C[0][0] to r7
	add r0, r0, #24
	ldr r7, [r0]

	/*
	Multiple A row 0 with B column 0
	The multiplied temporary values are stored in r4 - r6.
	The final result is stored in r8
	*/

	@ c[0][0] = r1 * r4 + r2 * r5 + r3 * r6
	mul r4, r1, r4
	mul r5, r2, r5
	mul r6, r3, r6
	add r8, r4, r5
	add r8, r8, r6

	add r8, r8, r7

	@ get the address of d[0][0]
	add r0, r0, #16
	str r8, [r0]

	/*==================================================*/
	@ r0 is always the pointer to the memory address in this code
	ldr r0, .matrix

	@ calculate answer for D[0][1]

	@ Load row 0 from A to r1-r3
	ldmia r0, {r1 - r3}

	@ Load column 1 from B to r4-r6
	add r0, r0, #36
	ldmia r0, {r4 - r6}

	@ Load C[0][1] to r7
	add r0, r0, #16
	ldr r7, [r0]

	/*
	Multiple A row 0 with B column 1
	The multiplied temporary values are stored in r4 - r6.
	The final result is stored in r8
	*/

	@ c[0][1] = r1 * r4 + r2 * r5 + r3 * r6
	mul r4, r1, r4
	mul r5, r2, r5
	mul r6, r3, r6
	add r8, r4, r5
	add r8, r8, r6

	add r8, r8, r7

	@ get the address of d[0][1]
	add r0, r0, #16
	str r8, [r0]

	/*==================================================*/
	@ r0 is always the pointer to the memory address in this code
	ldr r0, .matrix

	@ calculate answer for D[1][0]

	@ Load row 1 from A to r1-r3
	add r0, r0, #12
	ldmia r0, {r1 - r3}

	@ Load column 0 from B to r4-r6
	add r0, r0, #12
	ldmia r0, {r4 - r6}

	@ Load C[1][0] to r7
	add r0, r0, #32
	ldr r7, [r0]

	/*
	Multiple A row 0 with B column 0
	The multiplied temporary values are stored in r4 - r6.
	The final result is stored in r8
	*/

	@ c[1][0] = r1 * r4 + r2 * r5 + r3 * r6
	mul r4, r1, r4
	mul r5, r2, r5
	mul r6, r3, r6
	add r8, r4, r5
	add r8, r8, r6

	add r8, r8, r7

	@ get the address of d[1][0]
	add r0, r0, #16
	str r8, [r0]

	/*==================================================*/
	@ r0 is always the pointer to the memory address in this code
	ldr r0, .matrix

	@ calculate answer for D[1][1]

	@ Load row 1 from A to r1-r3
	add r0, r0, #12
	ldmia r0, {r1 - r3}

	@ Load column 1 from B to r4-r6
	add r0, r0, #24
	ldmia r0, {r4 - r6}

	@ Load C[1][1] to r7
	add r0, r0, #24
	ldr r7, [r0]

	/*
	Multiple A row 0 with B column 0
	The multiplied temporary values are stored in r4 - r6.
	The final result is stored in r8
	*/

	@ c[1][1] = r1 * r4 + r2 * r5 + r3 * r6
	mul r4, r1, r4
	mul r5, r2, r5
	mul r6, r3, r6
	add r8, r4, r5
	add r8, r8, r6

	add r8, r8, r7

	@ get the address of d[1][1]
	add r0, r0, #16
	str r8, [r0]

	@ store the memory address of D[0][0] to r1
	ldr r1, .matrix
	add r1, r1, #64

	nop
	.end
