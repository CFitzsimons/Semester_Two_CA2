;----------------------------;
;Author:    Colin Fitzsimons ;
;Date:      09/03/2013       ;
;Purpose:                    ;
;Add all ints up to 100      ;
;----------------------------;
    .data
Total:  .word 100       ;Holds the number to be ran to

    .text
main:
    ld r1, Total(r0)    ;Load counter into r1
    
loop:
    dadd r2, r2, r1     ;Add r2 to r1 and store into r2
    daddi r1, r1, -1    ;Dec r1
    bnez r1, loop       ;Loop if r1 is not zero
    
    sd r2, Total(r0)    ;Store the data into some memory loc.
    halt