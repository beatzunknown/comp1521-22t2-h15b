    .text

# t0 is i
# t1 is j
main:
    li      $t0, 1                  # int i = 1;
    
loop_i:
    bgt     $t0, 10, loop_i_end     # if (i > 10) goto loop_i_end;
    li      $t1, 0                  # int j = 0;

loop_j:
    bge     $t1, $t0, loop_j_end    # if (j >= i) goto loop_j_end;
    
    li      $a0, '*'                #
    li      $v0, 11                 # printf("%c",'*');
    syscall                         # 
    
    addi    $t1, $t1, 1             # j++;
    j       loop_j

loop_j_end:
    li      $a0, '\n'               #
    li      $v0, 11                 # printf("%c",'\n');
    syscall                         # 
    
    addi    $t0, $t0, 1             # i++;
    j       loop_i

loop_i_end:
    li      $v0, 0                  #
    jr      $ra                     # return 0
    
    