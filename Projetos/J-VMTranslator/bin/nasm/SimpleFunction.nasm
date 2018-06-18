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
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; End
