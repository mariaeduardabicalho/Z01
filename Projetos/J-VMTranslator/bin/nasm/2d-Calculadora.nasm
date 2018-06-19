; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 1 - PUSH constant 3
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
; 2 - PUSH constant 3
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
; 4 - POP temp 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
movw %A, %S
leaw $SP, %A
leaw $1, %A
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
; 6 - PUSH constant 0
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
; 7 - POP local 0
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
; 8 - PUSH argument 1
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
; 9 - POP local 1
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
; 10 - PUSH constant 0
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
; 11 - PUSH local 1
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
; 12 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
decw %A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $7FMET1K1LD3JH9OKYU, %A
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
leaw $ NO2IMZCG3KYEP6IUHZ, %A
jmp 
nop
7FMET1K1LD3JH9OKYU
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
NO2IMZCG3KYEP6IUHZ
; 14 - PUSH local 0
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
; 15 - PUSH argument 0
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
; 16 - ADD
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
; 17 - POP local 0
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
; 18 - PUSH local 1
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
; 19 - PUSH constant 1
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
; 20 - SUB
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
; 21 - POP local 1
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
; 23 - PUSH local 0
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
