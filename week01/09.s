    .data
prompt:
    .asciiz "Enter a number: "

    .text
main:
    la      $a0, prompt
    li      $v0, 4
    syscall                 # printf("Enter a number");

    li      $v0, 5
    syscall                 # scanf("%d", &x);

    move    $t0, $v0        # $t0 is x

    mul     $t1, $t0, $t0   # y = x * x ($t1 is y)

    move    $a0, $t1
    li      $v0, 1
    syscall                 # printf("%d", y);

    li      $a0, '\n'
    li      $v0, 11
    syscall                 # printf("%c", '\n');

    li      $v0, 1
    jr      $ra

