        .data

numbers:
        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  # int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

        .text

# t0 is i
# t1 is &numbers[i]
# t2 is i*4
main:
        li      $t0, 0                  # i = 0
    
loop_i:
        bge     $t0, 10, loop_i_end     # if (i >= 10) goto loop_i_end;
        
        mul     $t2, $t0, 4             # i*4
        la      $t1, numbers            #
        add     $t1, $t1, $t2           # &numbers[i]
        
        lw      $a0, ($t1)              #
        li      $v0, 1                  #
        syscall                         # printf("%d", numbers[i]);
        
        li      $a0, '\n'               #
        li      $v0, 11                 #
        syscall                         # printf("%c", '\n');
        
        addi    $t0, $t0, 1             # i++;
        
        j       loop_i

loop_i_end:
        li      $v0, 1                  #
        jr      $ra                     # return 0
    