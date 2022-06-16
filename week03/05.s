        .data

numbers:
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0  # int numbers[10] = {0};

        .text

# t0 is i
# t1 is &numbers[i]
main:
        li      $t0, 0                  # i = 0
        
        la      $t1, numbers            # &numbers[0]
    
loop_i:
        bge     $t0, 10, loop_i_end     # if (i >= 10) goto loop_i_end;
        
        li      $v0, 5                  #
        syscall                         # scanf("%d", &numbers[i]);
        sw      $v0, ($t1)              #
        
        addi    $t0, $t0, 1             # i++;
        addi    $t1, $t1, 4             # &numbers[i]
        
        j       loop_i

loop_i_end:
        li      $v0, 1                  #
        jr      $ra                     # return 0
    