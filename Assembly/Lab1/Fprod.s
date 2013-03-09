;Author:    Colin Fitzsimons ;
;Date:      09/03/2013       ;
;Purpose:                    ;
;Modification of Prod to use ;
;floating point numbers      ;
;----------------------------;

      .data
A:    .double 3.131
B:    .double 2.444986
C:    .double 0   ;Output

      .text
main:
      l.d f4,A(r0)
      l.d f5,B(r0)
      mul.d f3,f4,f5
      s.d f3,C(r0)
      halt 