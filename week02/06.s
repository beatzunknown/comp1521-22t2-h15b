    .data

PROMPT_MSG:
    .asciiz     "Enter a number: "
MEDIUM_MSG:
    .asciiz     "medium\n"
SMALL_BIG_MSG:
    .asciiz     "small/big\n"

    .text

# t0 is x
main:
    la      $a0, PROMPT_MSG             #
    li      $v0, 4                      # printf("Enter a number: ");
    syscall                             #

    li      $v0, 5                      #
    syscall                             # scanf("%d", &x);
    move    $t0, $v0                    #
    
if_medium:
    ble     $t0, 100, else_small_big    #
    bge     $t0, 1000, else_small_big   # if (x <= 100 || x >= 1000) goto else_case;
    
    la      $a0, MEDIUM_MSG             #
    li      $v0, 4                      # printf("medium\n");
    syscall                             #
    
    j       end

else_small_big:
    la      $a0, SMALL_BIG_MSG          #
    li      $v0, 4                      # printf("small/big\n");
    syscall                             #

end:
    li      $v0, 1                      #
    jr      $ra                         # return 0
    
    