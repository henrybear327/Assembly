# Readme

利用 `MOV`, `LSL`, and `LSR` 即可完成這個作業。

1. r1: 先左移 24 bits 去清除 [0, 7] 以外的區間, 然後再右移 24 bits 去做對齊。
2. r2: 先左移 16 bits 去清除 [0, 15] 以外的區間, 然後再右移 24 bits 去做對齊。
3. r3: 先左移 1 bit 去清除 [0, 30] 以外的區間, 然後再右移 19 bits 去做對齊。

# 編譯的方法

利用 `./arm-elf-gcc hw3.s -g -o hw3.exe` 進行編譯

程式執行環境為Ubuntu 15.10 64-bit，利用 `./arm-elf-insight` 執行，以方便直接更改r0數值
並觀察register的數值。

我使用的測試資料

1. r0: `0xabcdef` ans: `0x2a, 0xcd, 0xef`
2. r0: `0x40101`  ans: `0x1, 0x1, 0x1`

# 輸入法

https://github.com/henrybear327/Tutorial/blob/master/Assembly/gcin/readme.md

我們發現，透過更改系統的輸入法，可以解決64bit系統沒辦法直接改 memory 和
register 數值的問題。所以我們寫了一個教學，幫助大家 :)

# Code

```arm
@Homework 3

    .section .text
    .global main
    .type main, %function

main:
    MOV r0, #202 @assign a number

    @r1
    MOV r1, r0, LSL #24
    MOV r1, r1, LSR #24

    @r2
    MOV r2, r0, LSL #16
    MOV r2, r2, LSR #24

    @r3
    MOV r3, r0, LSL #1
    MOV r3, r3, LSR #19

    nop
    .end
```
