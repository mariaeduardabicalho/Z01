; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 2
leaw $SP, %A
movw (%A), %A
decw %A
; 6 - PUSH argument 0
; 7 - PUSH argument 1
; 8 - ADD
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
; End
