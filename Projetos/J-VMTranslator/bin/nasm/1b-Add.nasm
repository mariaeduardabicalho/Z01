; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 5
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
; 2 - PUSH constant 9
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
; End
