; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 123
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 23
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 4 - POP temp 0
; End
