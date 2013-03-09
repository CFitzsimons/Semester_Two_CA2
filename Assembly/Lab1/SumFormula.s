;----------------------------;
;Author:    Colin Fitzsimons ;
;Date:      09/03/2013       ;
;Purpose:                    ;
;Add all ints up to 100 using;
;a closed formula            ;
;----------------------------;

    .data
N:  .word 100

    .text
main:
    ld r1, N(r0)
    ld r2, N(r0)
    daddi r3, r3, 2     ;Put 2 into r3
    
    daddi r2, r2, 1     ;(N+1)
    dmul r1, r2, r1     ;N(N+1)
    ddiv r1, r1, r3     ;(N(N+1))/2
    
    sd r1, N(r0)        ;Store r1 into loc N
    halt
    