    .data

numbers:
    .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9  # int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

    .text

# t0 is i
# t1 is &numbers[i]
# t2 is numbers[i] = *($t1)
# t3 is i*4
main:
    li      $t0, 0                      # i = 0;
    
loop_i:
    bge     $t0, 10, loop_i_end         # if (i >= 10) goto loop_i_end;
    
    mul     $t3, $t0, 4                 # i * 4
    la      $t1, numbers                #
    add     $t1, $t1, $t3               # &numbers[i]
    lw      $t2, ($t1)                  # $t2 = numbers[i]
    
    bge     $t2, 0, if_numbers_i_ge_0   # if (numbers[i] < 0)
    addi    $t2, $t2, 42                # 
    sw      $t2, ($t1)                  # numbers[i] += 42;
    
if_numbers_i_ge_0:
    addi    $t0, $t0, 1                 # i++
    j       loop_i

loop_i_end:
    li      $v0, 1                      #
    jr      $ra                         # return 0
    