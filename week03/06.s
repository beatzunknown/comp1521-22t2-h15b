    .data

numbers:
    .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9  # int numbers[10] = {0,1,2,3,4,5,6,7,8,9};

    .text

# t0 is i
# t1 is &numbers[i]
# t2 is i*4
main:
    
loop_i:

loop_i_end:
    li      $v0, 1                  #
    jr      $ra                     # return 0
    