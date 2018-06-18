; Inicialização para VM
leaw $256,%A
movw %A,%D
leaw $SP,%A
movw %D,(%A)
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
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
je %D
nop
leaw $0, %A
movw %A, %D
movw %S, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
TRUE:
leaw $0, %A
movw %A, %D
movw %S, %A
neg %D
movw %D, (%A)
END:
; 8 - PUSH temp 0
; 9 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 10 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 11 - POP temp 0
; 12 - PUSH temp 1
; 13 - PUSH temp 1
; 14 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 15 - POP temp 1
; End
