.text
.globl main

main:

addi $t0, $0, -420

slt $t1, $t0, $0

bne $t1, $0, absolute
j exit

absolute:
sub $t0, $0, $t0

exit:
li   $v0, 10     # syscall to exit cleanly from main only
    syscall

    .end
