# About this readme

[Click here](https://github.com/henrybear327/Assembly/blob/master/hw5/README.md)
to get the best viewing experience. This readme is written in `markdown`.

# Features

Nothing special, the program can do just as much as the spec. required.

# Compilation

* Using VMWare Workstation 12, running Ubuntu 15.10
* `hw5.exe` is compiled using `arm-elf-gcc hw5.s -o hw5.exe -g`
* `Makefile` is included, so you can simply `make` it!

# Implementation

1. Simply brute force the process.

2. Basically, four matrices are declared as words in the text section. The variable names are the same as shown in the tables above.

3. During calculation:
    * `r0` -> stores the memory of .matrix
    * `r1 ~ r7` -> stores the value to be operated
    * `r8` stores the final result for `D[i][j]`

    After 4 iterations, the final answer is stored in the memory, where `r1` is pointing at.

# My input and expected output

A: 2 \* 3 matrix

```
+---+---+---+
| 1 | 2 | 3 | (a1)
| 4 | 5 | 6 | (a2)
+---+---+---+
```

B: 3 \* 2 matrix

```
.(b1) (b2).
+----+----+
| 7  | 8  |
| 9  | 10 |
| 11 | 12 |
+----+----+
```

C: 2 \* 2 matrix

```
+----+----+
| 13 | 14 | (c1)
| 15 | 16 | (c2)
+----+----+
```

D: 2 \* 2 matrix (D = A \* B + C, which is the answer matrix)

```
+-----+-----+
| 71  | 78  | (d1)
| 154 | 170 | (d2)
+-----+-----+
```
