# README

這個文章是使用 `markdown` 所撰寫，可以使用 atom 編輯器 preview markdown, 或是到[這裡](https://github.com/henrybear327/Assembly/blob/master/hw4/README.md)觀看。

# 程式功能

將兩個 unsigned integer 裝進 r0 和 r1，並執行程式，即可在 r0 裡看到剛剛所輸入的兩數字之最大公因數。

# 如何編譯

使用指令 `arm-elf-gcc -g -o hw4.exe hw4.s` (我的 arm compiler 路徑有設定在 `$PATH` 中，所以不用`./`)

我也有使用makefile，裡頭用的編譯指令也是 `arm-elf-gcc -g -o hw4.exe hw4.s` 。

# 如何執行

啟動 `arm-elf-insight`，並使用監看 register 的視窗，來進行 r0 和 r1 register 的數值修改，進而進行程式測試。

# 測試資料

1. 30 10
2. 10 30
3. 17 13
4. 13 17
5. 100 24
6. 24 100

# 參考資料

同學有寫了一篇[教學](https://henrybear327.gitbooks.io/gitbook_tutorial/content/Assembly/ARM-Instruction/Conditional-Execution/index.html)，幫助很大。

# Source code

```as
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
```
