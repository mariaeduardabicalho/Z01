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
; 4 - POP temp 0
; 5 - PUSH constant 8
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
; 9 - PUSH temp 0
; 10 - PUSH temp 2
; 12 - POP temp 1
; 14 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 15 - POP local 0
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
; 16 - PUSH argument 1
; 17 - POP local 1
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
; 18 - PUSH constant 0
leaw $SP, %A
movw (%A), %A
decw %A
; 19 - PUSH local 1
; 20 - EQ
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
; 22 - PUSH local 0
; 23 - PUSH argument 0
; 24 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 25 - POP local 0
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
; 26 - PUSH local 1
; 27 - PUSH constant 1
leaw $SP, %A
movw (%A), %A
decw %A
; 28 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 29 - POP local 1
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
; 31 - PUSH local 0
; End
