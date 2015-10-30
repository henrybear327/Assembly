    .section .text
    .global main
    .type main, %function
main: 
    MOV r0, #202 @assign a number

    @r1
    MOV r1, r0, LSL #24 @clear front
    MOV r1, r1, LSR #24 @clear back

    @r2
    MOV r2, r0, LSL #16 @clear front
    MOV r2, r2, LSR #24 @clear back

    @r3
    MOV r3, r0, LSL #1 @clear front
    MOV r3, r3, LSR #19 @clear back
    
    nop
    .end
