    .data

PROMPT_MSG:
    .asciiz     "Enter a number: "
ERROR_MSG:
    .asciiz     "square too big for 32 bits\n"

    .text

# t0 is x
# t1 is y
main:
    la      $a0, PROMPT_MSG             #
    li      $v0, 4                      # printf("Enter a number: ");
    syscall                             #
    
    li      $v0, 5                      # scanf("%d", &x);
    syscall                             #
    
    move    $t0, $v0
    
if_too_big:
    ble     $t0, 46340, else_square     #if (x <= 46340) goto else_case;
    
    la      $a0, ERROR_MSG              #
    li      $v0, 4                      # printf("square too big for 32 bits\n");
    syscall                             #
    
    j       end

else_square:
    mul     $t1, $t0, $t0               # y = x * x;
    
    move    $a0, $t1
    li      $v0, 1
    syscall                             # printf("%d", y);
    
    li      $a0, '\n'
    li      $v0, 11
    syscall                             # printf("\n");


end:
    li      $v0, 1                      #
    jr      $ra                         # return 0
    
    