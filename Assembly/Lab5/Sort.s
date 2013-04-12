.data

;
; Sort values a[0] though a[N-1] (inclusive) using selection sort.  Run the
; program and observe that the array (beginning in memory at a0) is sorted.
; 
; Currently:
;   - 2249 cycles, with 231 stalls.
;
; Known to be achievable:
;   - 1248 cycles, with 0 stalls.
;
; You should not fundamentally change the selection sort algorithm being used.
; You may, however, remove any obvious inefficiencies in the implementation.  In fact,
; this is a good place to start.
;
; *** Ensure forwarding and the branch delay slot are both enabled. ***
;

N:      .word 20

a0:     .word 23      ; a[0]
        .word 12      ; a[1]
        .word 19      ; a[2]
        .word 9       ; .
        .word 98      ; .
        .word 4       ; .
        .word 7
        .word 9
        .word 30405
        .word 21
        .word 16288
        .word 26483
        .word 9982
        .word 261
        .word 5025
        .word 18825
        .word 30405
        .word 9575
        .word 9575
        .word 25247   ; a[19]

;
; Rough approach:
;
; for (i=0; i<N; i+=1)
; {
;    int mi = i; // mi = minimum index.
;    int j;
;    
;    for (j=i+1; j<N; j+=1)
;       if ( a[j] < a[mi] )
;          mi = j;
;    
;    // swap a[i] <-> a[mi]
;    int t = a[mi];
;    a[mi] = a[i];
;    a[i] = t;
; }
;

.text
      ; r1 is the address of the i-th element (like main loop counter, address of a[i])
      ; r2 is the address after the last element in array (address of a[N], after end of array)
      ; r3 is the address of a candidate minimum value during the inner loop (address of a[mi])
      ; r4 is the address of the j-th element (like inner loop counter, address of a[j])

start:                    ; set up r1 (like i = 0)
            ; r1 = address of a[0]
      ld r8,N(r0)
      daddi r1,r0,a0
               
      dsll r8,r8,3
      dadd r2,r1,r8
      daddi r2, r2, -8

main:                     ; start of the outer loop 
      daddi r4,r1,8       
      ld r11,0(r1)
      
loop:
      beq r4,r2,done_loop 
      daddi r13,r4, 0 
       
      
      slt r12,r10,r11    
        daddi r4,r4,8
     beqz r12,loop
        ld r10,0(r4)
      
      daddi r3,r13,0           
       
      j loop
      ld r11,0(r3)                  

done_loop:               
      daddi r1,r1,8
      sd r11,-8(r1)        
next_main:
       
        
      ;ld r11,0(r3)
      bne r1,r2,main
      sd r10,0(r3)

done:                     ; done
      halt                ; halt