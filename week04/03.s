        .data

array:
        .word 1, 2, 3, 4, 5, 6, 4, 3, 2, 1

        .text
        
main:
# Args:     void
# Returns:
#       - $v0: int
#
# Frame:        [$ra, ...]
# Uses:         [...]
# Clobbers:     [...]
#
# Locals:
#       - [...]
#
# Structure:
#       main
#       -> [prologue]
#       -> body
#       -> [epilogue]

main__prologue:
        begin                           # create stack frame
        push    $ra                     # save $ra
        
main__body:
        la      $a0, array              #
        li      $a1, 10                 #
        jal     max                     # max(array, 10);
        
        move    $a0, $v0                #
        li      $v0, 1                  #
        syscall                         # printf("%d", max(array, 10));
        
        li      $a0, '\n'               #
        li      $v0, 11                 #
        syscall                         # printf("%c", '\n');
        
main__epilogue:
        pop     $ra                     # restore $ra
        end                             # destroy stack frame
        
        li      $v0, 1                  #
        jr      $ra                     # return 0
        
# t0 is row
# t1 is col
# t2 is (row*12 + col)
# t3 is &flag[row][col] or (&flag + row*12 + col)
max:
# Args:     int a[], int length
# Returns:
#       - $v0: int
#
# Frame:        [$ra, $v0, $s0, $s1]
# Uses:         [$v0, $a0, $a1, $s0, $s1]
# Clobbers:     [$a0, $a1]
#
# Locals:
#       - 'first_element' in $s0
#       - 'max_so_far' in $s1
#
# Structure:
#       max
#       -> [prologue]
#       -> max__body
#       -> max__length_eq_1
#       -> max__length_eq_1_f
#               -> max__first_gt_max
#               -> max__first_gt_max_f
#       -> [epilogue]

max__prologue:
        begin                                   # create stack frame
        push    $ra                             # save $ra
        push    $s0                             # save $s0
        push    $s1                             # save $s1
        
max__body:
        lw      $s0, ($a0)                      # int first_element = a[0];
        
        bne     $a1, 1, max__length_eq_1_f      # if (length == 1) {

max__length_eq_1:
        move    $v0, $s0                        #
        j       max__epilogue                   # return first_element;

max__length_eq_1_f:
        addi    $a0, $a0, 4                     # &a[1]
        sub     $a1, $a1, 1                     # length - 1
        jal     max                             # int max_so_far = max(&a[1], length - 1);
        move    $s1, $v0                        #
        
        ble     $s0, $s1, max__first_gt_max_f   # if (first_element > max_so_far) {

max__first_gt_max:
        move    $s1, $s0                        # max_so_far = first_element;
        
max__first_gt_max_f:
        move    $v0, $s1                        #
        j       max__epilogue                   # return max_so_far;

max__epilogue:
        pop     $s1                             # restore $s1
        pop     $s0                             # restore $s0
        pop     $ra                             # restore $ra
        end                                     # destroy stack frame
        
        jr      $ra                             # return $v0
    