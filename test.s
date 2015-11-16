    .section .text
    .global main
    .type main, %function
main: 

    mov r0, #-7
    cmp r0, #0
    mov r1, #-1
    mulmi r2, r0, r1
    
    nop
    .end
