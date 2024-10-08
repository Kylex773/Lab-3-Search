.data
asize0:  .word    16, 16, 4, 4    #i, j, k, l
frame0:  .word    0, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
         .word    1, 2, 3, 4, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 
         .word    2, 3, 32, 1, 2, 3, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 
         .word    3, 4, 1, 2, 3, 4, 18, 21, 24, 27, 30, 33, 36, 39, 42, 45, 
         .word    0, 4, 2, 3, 4, 5, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 
         .word    0, 5, 3, 4, 5, 6, 30, 35, 40, 45, 50, 55, 60, 65, 70,  75, 
         .word    0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 
         .word    0, 4, 14, 21, 28, 35, 42, 49, 56, 63, 70, 77, 84, 91, 98, 105, 
         .word    0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 
         .word    0, 9, 18, 27, 36, 45, 54, 63, 72, 81, 90, 99, 108, 117, 126, 135, 
         .word    0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150, 
         .word    0, 11, 22, 33, 44, 55, 66, 77, 88, 99, 110, 121, 132, 143, 154, 165, 
         .word    0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 0, 1, 2, 3, 
         .word    0, 13, 26, 39, 52, 65, 78, 91, 104, 114, 130, 143, 1, 2, 3, 4, 
         .word    0, 14, 28, 42, 56, 70, 84, 98, 112, 126, 140, 154, 2, 3, 4, 5, 
         .word    0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165, 3, 4, 5, 6 
window0: .word    0, 1, 2, 3, 
         .word    1, 2, 3, 4, 
         .word    2, 3, 4, 5, 
         .word    3, 4, 5, 6 

.text
.globl main 

main:
    la      $a0, asize0     # 1st parameter: address of asize0[0]
    la      $a1, frame0     # 2nd parameter: address of frame0[0]
    la      $a2, window0    # 3rd parameter: address of window0[0]

    add  $s0, $a1, $0 #s0 is current spot in array

    lw $s1, 0($a0)  #value of i, rows of frame(big)
    lw $s2, 4($a0)  #value of j, columns of frame
    lw $s3, 8($a0)  #value of k, rows of window(small)
    lw $s4, 12($a0) #value of l, columns of window




    sub  $t7, $s2, $s4 #find itterations till right edge, s4 for rows
    addi $t7, $t7, 1 #starts offset at 1



    add  $t8, $0, $0 #offset of rows starts at 0
    add  $t9, $0, $0 #offset of columns starts at 0

    j columnRight #begin search


    columnRightPre: #toDo write transitions from rowUp
    sub $t7, $s2, $s4 #find itterations till right edge
    add $t7, $t7, $t9 #add column offset

    beq $t7, $0, exit #if loops till edge is 0, then we are done

    sll $t0, $s2, 2 #multiply by 4 for word align
    add $s0, $s0, $t0 #move down extra row
    add $s0, $s0, 4 #move right 1

    addi $t9, $t9, -1 #increment column offset

    columnRight:
    beq $t7, $0, rowDownPre #when edge is hit start moving down

    #toDo SAD function
    lw $t6, 0($s0) #print output

    addi $s0, $s0, 4 #itterate spot by one column
    addi $t7, $t7, -1 #move one closer to edge
    j columnRight #loop
   
    
    rowDownPre:  #toDo write transitions from columnRight
    sub $s5, $s1, $s3 #find itterations till bottom edge
    add $s5, $s5, $t8 #add the row offset

    beq $s5, $0, exit #if loops till edge is 0, then we are done

    addi $s0, -4  #move back extra column
    sll, $t0, $s2, 2 #multiply by 4 for word allign
    add  $s0, $s0, $t0 #move down row

    addi $t8, $t8, -1 #increment offset value of row

    rowDown:
    beq $s5, $0 columnLeftPre

    #toDo SAD function
    lw $t6, 0($s0) #print output

    sll $t0, $s2, 2 #multiply by 4 for word allign
    add $s0, $s0, $t0 #move down a row
    addi $s5, $s5, -1 #move one closer to edge
    j rowDown #loop

    columnLeftPre: #t0Do write transitions from rowDown
    sub $t7, $s2, $s4 #find itterations till left edge
    add $t7, $t7, $t9 #add column offset

    beq $t7, $0, exit #if loops till edge is 0, then we are done

    sll $t0, $s2, 2 #multiply by 4 for word allign
    sub $s0, $s0, $t0 #move up extra row
    addi $s0, $s0, -4 #move left

    addi $t9, $t9, -1 #increment column offset

    columnLeft:
    beq $t7, $0, rowUpPre #change direction when edge hit

    #toDo SAD function
    lw $t6, 0($s0) #print output

    addi $s0, $s0, -4 #move left by one
    addi $t7, $t7, -1 #move one closer to edge

    j columnLeft #loop

    rowUpPre:
    sub $s5, $s1, $s3 #find itterations till top edge
    add $s5, $s5, $t8 #add row offset

    beq $s5, $0, exit #if loops till edge is 0, then we are done

    addi $s0, $s0, 4 #move right extra column
    sll  $t0, $s2, 2 #multiply by 4 for word align
    sub $s0, $s0, $t0 #move up a row

    addi $t8, $t8, -1 #increment row offset

    rowUp:
    beq $s5, $0, columnRightPre #change direction when edge hit

    #toDo SAD function
    lw $t6, 0($s0) #print output

    sll $t0, $s2, 2 #multiply by 4 for world align
    sub $s0, $s0, $t0 #move up a row
    addi $s5, $s5, -1 #move one closer to edge
    j rowUp #loop



    exit:
    
    
    li   $v0, 10     # syscall to exit cleanly from main only
    syscall

    .end
