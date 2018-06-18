; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH argument 0
; 2 - POP static 0
; 3 - PUSH argument 1
; 4 - POP static 1
; 5 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - PUSH static 0
; 9 - PUSH static 1
; 10 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 13 - PUSH argument 0
; 14 - POP static 0
; 15 - PUSH argument 1
; 16 - POP static 1
; 17 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 20 - PUSH static 0
; 21 - PUSH static 1
; 22 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 25 - PUSH constant 6
leaw $SP, %A
movw (%A), %A
decw %A
; 26 - PUSH constant 8
leaw $SP, %A
movw (%A), %A
decw %A
; 28 - POP temp 0
; 29 - PUSH constant 23
leaw $SP, %A
movw (%A), %A
decw %A
; 30 - PUSH constant 15
leaw $SP, %A
movw (%A), %A
decw %A
; 32 - POP temp 0
; End
