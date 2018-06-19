; 0 - PUSH constant 5
leaw $5, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 1 - PUSH constant 15
leaw $15, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 2 - PUSH constant 15
leaw $15, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 3 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $IJM1W3YNCOFPZXV85P, %A
je %D
nop
incw %A
movw %A, %D
leaw $0,%A
movw %A, %S
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %S,(%A)
incw %A
leaw $SP,%A
movw %D,(%A)
leaw $ Y9RH4146V7FOPQ76S9, %A
jmp 
nop
IJM1W3YNCOFPZXV85P
incw %A
movw %A, %D
leaw $-1,%A
movw %A, %S
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %S,(%A)
incw %A
leaw $SP,%A
movw %D,(%A)
Y9RH4146V7FOPQ76S9
; 5 - PUSH constant 3
leaw $3, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 6 - POP temp 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
movw %A, %S
leaw $SP, %A
leaw $0, %A
movw %A, %S
leaw $5, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 7 - PUSH constant 15
leaw $15, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 8 - PUSH constant 9
leaw $9, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 9 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $IE44V56HS91DDY30AT, %A
je %D
nop
incw %A
movw %A, %D
leaw $0,%A
movw %A, %S
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %S,(%A)
incw %A
leaw $SP,%A
movw %D,(%A)
leaw $ 0F2Z51MXLB5VRJG34H, %A
jmp 
nop
IE44V56HS91DDY30AT
incw %A
movw %A, %D
leaw $-1,%A
movw %A, %S
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %S,(%A)
incw %A
leaw $SP,%A
movw %D,(%A)
0F2Z51MXLB5VRJG34H
; 11 - PUSH constant 2
leaw $2, %A
movw %A, %S
leaw $SP, %A
movw (%A), %D
movw %D, %A
movw %S, (%A)
leaw $SP, %A
movw (%A), %A
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 12 - POP temp 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
movw %A, %S
leaw $SP, %A
leaw $1, %A
movw %A, %S
leaw $5, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; End
