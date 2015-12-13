# 程式的內容

透過一個C語言程式，去呼叫numsort.s。

(組語的source code真的寫得不好，很亂...)

# 編譯程式

直接使用`make`指令即可。

原始指令:
```
all: call_numsort.c numsort.s
	arm-elf-gcc -std=c99 -Wall -Wextra -g -o call_numsort.exe call_numsort.c numsort.s
clean:
	rm -f *.exe *.o
```

# 執行程式

`arm-elf-run call_numsort.exe `

請先輸入一個整數n，並在其後連續輸入n個數字。

程式會將這n個數字由小到大排列後，輸出至螢幕上。
