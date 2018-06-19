; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 7
leaw $7, %A
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
; 2 - PUSH constant 2
leaw $2, %A
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
; 4 - PUSH constant 3
leaw $3, %A
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
; 8 - PUSH constant 0
leaw $0, %A
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
leaw $1, %A
movw %A, %S
leaw $ARG, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
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
leaw $0, %A
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
; 13 - PUSH local 1
leaw $1, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 14 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $1MUXGLHGT74QK782AT, %A
je %D
nop
incw %A
movw %A, %D
leaw $0,%A
movw %A, %S
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %S,(%A)
incw %A
leaw $SP,%A
movw %D,(%A)
leaw $ FM4XC47DYMQL8O3PJ6, %A
jmp 
nop
1MUXGLHGT74QK782AT
incw %A
movw %A, %D
leaw $-1,%A
movw %A, %S
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %S,(%A)
incw %A
leaw $SP,%A
movw %D,(%A)
FM4XC47DYMQL8O3PJ6
; 16 - PUSH local 0
leaw $0, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 17 - PUSH argument 0
leaw $0, %A
movw %A, %S
leaw $ARG, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 18 - ADD
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
leaw $1, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 21 - PUSH constant 1
leaw $1, %A
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
; 22 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
incw %A
movw %A, %D
leaw $SP,%A
movw %D, (%A)
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
leaw $0, %A
movw %A, %S
leaw $LCL, %A
movw (%A), %D
movw %D, %A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; End
