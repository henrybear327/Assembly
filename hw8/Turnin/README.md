# 你程式的內容

執行程式時會先要求使用者輸入一個數字n, 代表要sort的數列數字個數。輸入完n後，接下來請輸入n個數字。

程式將會利用bubble sort將數列由小到大排序，並且輸出到螢幕上。同時，程式也會產生一個`sort_result.txt`檔，並且在螢幕上顯示檔案輸出是否成功!

# 如何編譯程式

Simply `make` it!

Or use the following command `arm-elf-gcc -std=c99 -Wall -Wextra -g -o call_numsort.exe output.s call_numsort.c numsort.s`

# 如何執行程式

run `arm-elf-run call_numsort.exe` in the terminal
