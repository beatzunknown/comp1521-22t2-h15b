    .text

# t0 is x
main:
    li      $t0, 24                     # int x = 24;
    
loop:
    bge     $t0, 42, end                # if (x >= 42) goto loop_end;
    
    move    $a0, $t0                    #
    li      $v0, 1                      # printf("%d",x);
    syscall                             # 
    
    li      $a0, '\n'                   #
    li      $v0, 11                     # printf("%c",'\n');
    syscall                             # 
    
    addi    $t0, $t0, 3                 # x += 3;
    
    j       loop

end:
    li      $v0, 1                      #
    jr      $ra                         # return 0
    
    