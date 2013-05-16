.data

    nums:   .word   1552, 23, 0, -45, 18 ...

.text
    ld r1, r0(r0)        ;Counts the number of odd integers
    ld r2, r0(r0)        ;Tracks the index of nums
    daddi r3, r0, 8000  ;Tracks numbers up to 1000
    
main:
    beq r2, r3, finish
    
    ld r4, nums(r2)
    andi r4, r4, 1
    daddi r2, r2, 8
    beqz r4, main
    
    daddi r1, r1, 1
    j main
    
finish:
    halt