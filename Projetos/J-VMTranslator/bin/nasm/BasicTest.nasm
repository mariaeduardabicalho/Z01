; 0 - PUSH constant 10
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH local 0
; 2 - POP local 0
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
; 3 - PUSH constant 21
leaw $SP, %A
movw (%A), %A
decw %A
; 4 - PUSH constant 22
leaw $SP, %A
movw (%A), %A
decw %A
; 5 - POP argument 2
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $ARG, %A
movw (%A), %S
leaw $2, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 6 - POP argument 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $ARG, %A
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
; 7 - PUSH constant 36
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - POP this 6
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THIS, %A
movw (%A), %S
leaw $6, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 9 - PUSH constant 42
leaw $SP, %A
movw (%A), %A
decw %A
; 10 - PUSH constant 45
leaw $SP, %A
movw (%A), %A
decw %A
; 11 - POP that 5
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THAT, %A
movw (%A), %S
leaw $5, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 12 - POP that 2
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THAT, %A
movw (%A), %S
leaw $2, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 13 - PUSH constant 510
leaw $SP, %A
movw (%A), %A
decw %A
; 14 - POP temp 6
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
movw %A, %S
leaw $SP, %A
leaw $6, %A
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
; 15 - PUSH local 0
; 16 - PUSH that 5
; 17 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw %D, (%A), %S
movw %S, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 18 - PUSH argument 1
; 19 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 20 - PUSH this 6
; 21 - PUSH this 6
; 22 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw %D, (%A), %S
movw %S, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; 23 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 24 - PUSH temp 6
; 25 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw %D, (%A), %S
movw %S, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End
