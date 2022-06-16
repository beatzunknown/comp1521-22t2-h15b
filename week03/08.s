    .data

numbers:
     .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  # int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

    .text

# t0 is i
# t1 is i*4
# t2 is &numbers[i]
# t3 is x or numbers[i]
# t4 is (9-i)*4
# t5 is &numbers[9-i]
# t6 is y or numbers[9-i]

main:
    li      $t0, 0                  # i = 0
    
loop_i:
    bge     $t0, 5, loop_i_end      # if (i >= 5) goto loop_i_end;
    
    mul     $t1, $t0, 4             # i * 4
    la      $t2, numbers            #
    add     $t2, $t2, $t1           # &numbers[i]
    lw      $t3, ($t2)              # int x = numbers[i];
    
    li      $t4, 9                  #
    sub     $t4, $t4, $t0           #
    mul     $t4, $t4, 4             # (9-i)*4
    la      $t5, numbers            #
    add     $t5, $t5, $t4           # &numbers[9-i]
    lw      $t6, ($t5)              # int y = numbers[9 - i];
    
    sw      $t6, ($t2)              # numbers[i] = y;
    sw      $t3, ($t5)              # numbers[9 - i] = x;
    
    addi    $t0, $t0, 1             # i++;
    
    j       loop_i

loop_i_end:
    li      $v0, 1                  #
    jr      $ra                     # return 0
    