; 0 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - POP temp 0
; 2 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - POP temp 1
; 4 - PUSH temp 0
; 5 - PUSH constant 10
leaw $SP, %A
movw (%A), %A
decw %A
; 6 - EQ
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
; 8 - PUSH temp 0
; 9 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 10 - ADD
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
addw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D,(%A)
; 11 - POP temp 0
; 12 - PUSH temp 1
; 13 - PUSH temp 1
; 14 - ADD
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
addw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D,(%A)
; 15 - POP temp 1
; End
