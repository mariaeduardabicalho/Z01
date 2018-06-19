; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 14
leaw $14, %A
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
; 2 - PUSH constant 2
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
; 3 - ADD
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
addw (%A),%S,%D
movw %D,(%A)
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; 4 - POP temp 0
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
; 5 - PUSH constant 8
leaw $8, %A
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
; 6 - PUSH constant 1
leaw $1, %A
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
; 7 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 8 - POP temp 2
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
movw %A, %S
leaw $SP, %A
leaw $2, %A
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
; 9 - PUSH temp 0
leaw $0, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 10 - PUSH temp 2
leaw $2, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
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
; 14 - PUSH constant 0
leaw $0, %A
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
; 15 - POP local 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $0, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 16 - PUSH argument 1
leaw $1, %A
movw %A, %S
leaw $ARG, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 17 - POP local 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $1, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 18 - PUSH constant 0
leaw $0, %A
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
; 19 - PUSH local 1
leaw $1, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 20 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $J4086K0EED1Y9CLNKA, %A
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
leaw $ 2RPRDLL0XT6BDLPNYQ, %A
jmp 
nop
J4086K0EED1Y9CLNKA
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
2RPRDLL0XT6BDLPNYQ
; 22 - PUSH local 0
leaw $0, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 23 - PUSH argument 0
leaw $0, %A
movw %A, %S
leaw $ARG, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 24 - ADD
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
addw (%A),%S,%D
movw %D,(%A)
incw %A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
; 25 - POP local 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $0, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 26 - PUSH local 1
leaw $1, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 27 - PUSH constant 1
leaw $1, %A
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
; 28 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 29 - POP local 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $1, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 31 - PUSH local 0
leaw $0, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; End
