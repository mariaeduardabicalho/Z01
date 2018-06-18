; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 5
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 9
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - ADD
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
; 4 - POP temp 0
; End
