.data
asize0:  .word    16, 16, 8, 4    #i, j, k, l
frame0:  .word    7, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
         .word    7, 8, 8, 8, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
         .word    7, 8, 8, 8, 2, 8, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 
         .word    7, 8, 8, 8, 8, 8, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 
         .word    0, 4, 8, 8, 8, 8, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
         .word    0, 5, 8, 8, 8, 8, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
         .word    0, 6, 8, 8, 8, 8, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 8, 8, 8, 8, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 1, 8, 8, 8, 8, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 1, 8, 8, 8, 8, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 8, 8, 8, 8, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    9, 9, 9, 9, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    9, 9, 9, 9, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4, 
         .word    9, 9, 9, 9, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5, 
         .word    9, 9, 9, 9, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 
window0: .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8, 
         .word    8, 8, 8, 8



.text
.globl main

main:

    la      $a0, asize0     # 1st parameter: address of asize0[0]
    la      $a1, frame0     # 2nd parameter: address of frame0[0]
    la      $a2, window0    # 3rd parameter: address of window0[0]

    lw $s1, 0($a0)  #value of i, rows of frame(big)
    lw $s2, 4($a0)  #value of j, columns of frame
    lw $s3, 8($a0)  #value of k, rows of window(small)
    lw $s4, 12($a0) #value of l, columns of window


    add  $s7, $a1, $0 #s7 is minimum SAD address

    addi $s7, $s7, 200 #testing

    lw $t0, 0($s7) #testing

    sub $t1, $s7, $a1 #find index in array
    srl $t1, $t1, 2 #convert from word index

    addi $t2, $0, -1

    loop:
    slt $t3, $t1, $0 #is t1 < 0
    bne $t3, $0, colunnIndex #leave if so
    sub $t1, $t1, $s1 #increment row up
    addi $t2, $t2, 1 #increment row index
    j loop

    colunnIndex:
    add $t1, $t1, $s1 #increment row up
    


exit:
li   $v0, 10     # syscall to exit cleanly from main only
    syscall

    .end