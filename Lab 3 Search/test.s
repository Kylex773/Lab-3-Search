.data
asize0:  .word    4,  4,  2, 2    #i, j, k, l
frame0:  .word    0,  0,  1,  2, 
         .word    0,  0,  3,  4
         .word    0,  0,  0,  0
         .word    0,  0,  0,  0, 
window0: .word    1,  2, 
         .word    3,  4, 

.text
.globl main 

main:
    la      $a0, asize0     # 1st parameter: address of asize0[0]
    la      $a1, frame0     # 2nd parameter: address of frame0[0]
    la      $a2, window0    # 3rd parameter: address of window0[0]

    add $s1, $a1, $0

    add $t0, $a0, $0
    addi $t1, $a0, 1
    addi $t2, $a0, 2
    addi $t3, $a0, 3
