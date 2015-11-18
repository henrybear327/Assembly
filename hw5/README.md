# Sample input and sample output

A: 2 \* 3 matrix

```
+---+---+---+
| 1 | 2 | 3 | (a1)
| 4 | 5 | 6 | (a2)
+---+---+---+
```

B: 3 \* 2 matrix

```
+----+----+
| 7  | 8  | (b1)
| 9  | 10 | (b2)
| 11 | 12 | (b3)
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
+----+----+
```

# Implementation

1. Simply brute force the process.

2. Basically, four matrices are declared as words in the text section. The variable names are the same as shown in the tables above.

3. During calculation:
    * r0 -> stores the memory of .matrix
    * r1 ~ r7 -> stores the value to be operated
    * r8 stores the final result for D[i][j]
