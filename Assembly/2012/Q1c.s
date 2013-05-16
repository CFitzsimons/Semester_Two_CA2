.data
N:  .word   200

.text
ld r1, N(r0)

main:
addi r2, r1, 128
bnez r2, finish

dsrl r1, r1, 1
j main

halt