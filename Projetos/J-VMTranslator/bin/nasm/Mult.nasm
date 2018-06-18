; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 7
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
; 4 - PUSH constant 3
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 9 - POP local 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $0, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 10 - PUSH argument 1
; 11 - POP local 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $1, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 12 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 13 - PUSH local 1
; 14 - EQ
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
; 16 - PUSH local 0
; 17 - PUSH argument 0
; 18 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 19 - POP local 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $0, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 20 - PUSH local 1
; 21 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 22 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 23 - POP local 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $1, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 25 - PUSH local 0
; End
