; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 14
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 2
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
; 4 - POP temp 1
; 5 - PUSH constant 123
leaw $SP, %A
movw (%A), %A
decw %A
; 6 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 7 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 8 - POP temp 2
; 9 - PUSH temp 1
; 10 - PUSH temp 2
; 11 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 12 - POP temp 0
; End
