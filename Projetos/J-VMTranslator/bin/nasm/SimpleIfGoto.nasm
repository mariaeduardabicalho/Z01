; 0 - PUSH constant 5
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH constant 15
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 15
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $eqlabelt, %A
je %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $eqlabelf, %A
jmp 
nop
eqlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 5 - PUSH constant 3
leaw $SP, %A
movw (%A), %A
decw %A
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
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - PUSH constant 9
leaw $SP, %A
movw (%A), %A
decw %A
; 9 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $eqlabelt, %A
je %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $eqlabelf, %A
jmp 
nop
eqlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 11 - PUSH constant 2
leaw $SP, %A
movw (%A), %A
decw %A
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
