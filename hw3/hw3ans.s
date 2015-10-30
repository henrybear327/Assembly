      .section .text
      .global main
      .type main,%function

main:

      mov r0 , #157
      @ r0 :=157
      mov r4 , #100
      @ r4 :=100
      add r0 , r0 , r4
      @ r0 = r0+r4 = 257
      mov r1 , r0 , LSR #0
      @ r1 init and let r0's 0 in r1's 0
      mov r1 , r1 , LSL #25
      @ r1 omit useless left bit (8~32)
      mov r1 , r1 , LSR #25
      @ r1 return
      mov r2 , r0 , LSR #8
      @ r2 init and let r0's 8 in r2's 0
      mov r2 , r2 , LSL #25
      @ r2 omit useless left bit (8~32)
      mov r2 , r2 , LSR #25
      @ r2 return
      mov r3 , r0 , LSR #18
      @ r3 init and let r0's 18 in r3's 0
      mov r3 , r3 , LSL #20
      @ r3 omit useless left bit (13~32)
      mov r3 , r3 , LSR #20
      @ r3 return
      nop
      .end
