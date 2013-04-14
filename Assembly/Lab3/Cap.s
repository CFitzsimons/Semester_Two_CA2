    .data
str:        .asciiz "I am a string, capitalize me!\n"
CONTROL:    .word 0x10000
DATA:       .word 0x10008
;byte is terminate by a null character

    .text
    ld r21, CONTROL(r0)
    ld r22, DATA(r0)
    dadd r1, r0, r0     ;r1 holds the required displacement
    daddi r2, r0, 4
    
    daddi r10, r0, 10    ;Store null character
    daddi r11, r0, 32    ;Store space character
    
loop:
    lb r3, str(r1)
    jal capit
    sb r3, str(r1)
    daddi r1, r1, 1
    j loop
    
    ;;Print section

    halt
    
;Subroutine capit
;Uses:
;   r3 - the argument
;   r10 - escape character
;   r11 - space character
;   r12 - space character flag
;   r15, r16 - temporary storage
capit:
    beq r11, r3, setSpace  ;Jump to setSpace if character is a space
    beq r10, r3, print     ;Jump to print if character is \n
    beqz r12, stop         ;Jump if space flag is not set
    
    ;Check if it is a lowercase letter
    slti r15, r3, 122
    beqz r15, stop
    daddi r15, r0, 93
    slt r15, r15, r3
    beqz r15, stop
    ;End character checks
    
   ; daddi r15, r0, 64
    daddi r3, r3, -32   
stop:
    dadd r12, r0, r0
    jr r31
setSpace:
    daddi r12, r0, 1
    jr r31
print:
    ld r3, str(r0)
    sd r3, DATA(r0)
    sd r2, 0(r21)
    halt
    
    