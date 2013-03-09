;----------------------------;
;Author:    Colin Fitzsimons ;
;Date:      09/03/2013       ;
;Purpose:                    ;
;Calculate the 20th number   ;
; in the fibonacci sequence  ;
;----------------------------;
    .data
Num:    .word 20    ;Which number in the seq we want
Start:  .word 01    ;Default starting point
    .text
    ld r1, Num(r0)
    ld r2, Start(r0)
    ld r3, Start(r0)
    
    daddi r1, r1, -2
    
loop:
    dadd r4, r0, r3 ;Save r2 data
    dadd r3, r2, r3 ;Set r3 as the sum of r3 and r2
    dadd r2, r0, r4 ;Set r2 as r3
    daddi r1, r1, -1
    bnez r1, loop
    
    sd r3, Num(r0)  ;Store the data
    
    halt