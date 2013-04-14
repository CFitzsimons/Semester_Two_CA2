;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   NOTE                                           ;;
;; This program was not written by me.              ;;
;; Full credits to Stephen Blott who created        ;;
;; this solution.                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Output (to the terminal) all of the prime numbers which are less than N.

.data

CONTROL: .word  0x10000
DATA:    .word  0x10008

N:       .word  100000

msg:     .asciiz "out of memory\n"
cnt:     .word  0

; max:     .word  256       ; end of primes space
; primes:  .space 256       ; space for MAX/8 8-byte primes

max:     .word  65536     ; end of primes space
primes:  .space 65536     ; space for MAX/8 8-byte primes

.text

   ld r20,CONTROL(r0)     ; r20 is CONTROL address
   ld r21,DATA(r0)        ; r21 is DATA address

;  daddi r25,r0,1         ; test counter, halt after this many encounters
                          ; for testing only

; ******************************************************************
; main

   ld r10,N(r0)           ; N -> r10
   daddi r11,r0,2         ; i -> r11 (i = 2)

mloop:                    ; main loop ********
   movz r30,r11,r0        ; check whether i is prime
   jal prime

   daddi r11,r11,1        ; i = i + 1
   beq r10,r11,done       ; branch if i == N

   j mloop                ; main loop ********

done:
   halt                   ; exit

; ******************************************************************
; prime

; -----------------------------
; P = ARGUMENT;
; 
; for (j=0; j<cnt; j+=8)
; {
;    if ( P % primes[j] == 0 )
;       return;                        // P is not prime
;    if ( P < primes[j] * primes[j] )
;       jump(prime);                   // P is prime
; }
; 
; primes[cnt] = P;                     // P is prime
; cnt += 8;
; 
; output(P);
; return;
; -----------------------------

prime:                    ; prime subroutine
   movz r1,r30,r0         ; P -> r1 (P is the number we're checking)
   daddi r2,r0,0          ; j -> r2 (j = 0)
   ld r3,cnt(r0)          ; cnt -> r3
   ld r6,max(r0)          ; max -> r6

ploop:                    ; prime loop *******
   beq r2,r3,isprime      ; branch if cnt == j

   ld r4,primes(r2)       ; r4 = primes[j]
   ddiv r5,r1,r4          ; r5 = P/primes[j]
   dmul r5,r5,r4          ; r5 = P/primes[j] * primes[j]
   beq r1,r5,pdone        ; branch if P == P/j * j (so divisible, so not prime)
   
   dmul r4,r4,r4          ; r4 = primes[j] * primes[j]
   slt r5,r1,r4           ; set r5 if P < primes[j] * primes[j]
   bnez r5,isprime        ; P < primes[j] * primes[j]; so no need to check further

   daddi r2,r2,8          ; j = j + 8
   j ploop                ; prime loop *******
   
isprime:                  ; P (r1) is prime
   beq r3,r6,memory_error ; cnt equals max; out of memory

   sd r1,primes(r3)       ; primes[cnt] = P -- store new prime

   daddi r3,r3,8          ; cnt = cnt + 8   -- increment cnt
   sd r3,cnt(r0)          ; store cnt       -- store it

   sd r1,0(r21)           ; write P to DATA
   daddi r1,r0,2          ; 2, for writing an integer
   sd r1,0(r20)           ; write 2 to CONTROL

pdone:                    ; done prime
   jr r31                 ; return

; ******************************************************************
; error: out of memory

memory_error:             ; error: out of memory
   daddi r1,r0,msg        ; load address of memory error message
   sd r1,0(r21)           ; write address to DATA

   daddi r1,r0,4          ; 4, for writing a string
   sd r1,0(r20)           ; write 4 to CONTROL for string output

   halt                   ; cannot continue

; ******************************************************************
; test code

   ; daddi r25,r25,-1       ; subtract 1 from test counter
   ; beqz r25,halt          ; halt if test counter is zero
   
halt:
   halt