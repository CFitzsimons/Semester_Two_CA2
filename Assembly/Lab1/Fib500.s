;Author:    Colin Fitzsimons ;
;Date:      09/03/2013       ;
;Purpose:                    ;
;Calculate the first fibb    ;
;number before 500           ;
;----------------------------;
    .data
Num:     .word 500   ;Number to which we count
Start:   .word 01    ;Default starting point
Counter: .word 02    ;Coutner

    .text
    ld r1, Start(r0)
    ld r2, Start(r0)
    ld r3, Counter(r0)
    ld r4, Num(r0)  ;Holds the fibb number
    ;;r5 is being used as the temp register
loop:
    dadd r5, r0, r2 
    dadd r2, r2, r1 
    dadd r1, r0, r5 
    
    daddi r3, r3, 1
    slt r5, r2, r4
    bnez r5, loop
    
    sd r3, Counter(r0)  ;Store the data
    
    halt