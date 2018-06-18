; 0 - PUSH constant 3030
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - POP pointer 0
; 2 - PUSH constant 3040
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - POP pointer 1
; 4 - PUSH constant 32
leaw $SP, %A
movw (%A), %A
decw %A
; 5 - POP this 2
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THIS, %A
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
; 6 - PUSH constant 46
leaw $SP, %A
movw (%A), %A
decw %A
; 7 - POP that 6
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $THAT, %A
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
; 8 - PUSH pointer 0
; 9 - PUSH pointer 1
; 10 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 11 - PUSH this 2
; 12 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 13 - PUSH that 6
; 14 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; End
