    .section .text
    .global main
    .type main,%function

main:
    @ assign two numbers to r0 and r1

    MOV r0, #30
    MOV r1, #10

    @ beginning of the gcd loop
LOOP:
    /*
    if(r0 == r1) return either one to be the ans
    else
        if(r0 < r1) r1 -= r0;
        else r0 -= r1;
    */

    CMP r0, r1 @ CMP does (r0 - r1)

    @ Case 1: if r0 == r1, end program
    BEQ ENDPROGRAM

    @ Case 2: r0 - r1 < 0
    BMI SUB1

    @ Case 3: r0 - r1 > 0
    SUB r0 , r0 , r1 @ r0 = r0 - r1
    B LOOP

SUB1:
    SUB r1 , r1 , r0 @ r1 = r1 - r0
    B LOOP           @ Jump back to loop

ENDPROGRAM:
    @ r0 == r1 now, so no need to do MOV r1, r0
    nop
    .end
