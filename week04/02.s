        .data

flag:
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
        .byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'

        .text
        
# 2d array offset is:
# (index of first dimension) * (size of 2nd dimension) + (index of 2nd dimension)

# t0 is row
# t1 is col
# t2 is (row*12 + col)
# t3 is &flag[row][col] or (&flag + row*12 + col)
main:
        li      $t0, 0                  # int row = 0
    
loop_row:
        bge     $t0, 6, loop_row_end    # if (row < 6)
        
        li      $t1, 0                  # int col = 0
        
loop_col:
        bge     $t1, 12, loop_col_end   # if (col < 12)
        
        mul     $t2, $t0, 12            # row * rowSize
        add     $t2, $t2, $t1           # (row * rowSize) + col
        la      $t3, flag               # &flag
        add     $t3, $t3, $t2           # &flag[row][col]
        
        lb      $a0, ($t3)              # flag[row][col]
        li      $v0, 11                 #
        syscall                         # printf ("%c", flag[row][col]);

        addi    $t1, $t1, 1             # col++;
        
        j       loop_col

loop_col_end:
        li      $a0, '\n'               #
        li      $v0, 11                 #
        syscall                         # printf ("\n");
        
        addi    $t0, $t0, 1             # row++;
        
        j       loop_row

loop_row_end:
        li      $v0, 1                  #
        jr      $ra                     # return 0
    