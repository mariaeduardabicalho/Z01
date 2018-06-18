; 0 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - EQ
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
; 3 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 4 - PUSH constant 16
leaw $SP, %A
movw (%A), %A
decw %A
; 5 - EQ
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
; 6 - PUSH constant 16
leaw $SP, %A
movw (%A), %A
decw %A
; 7 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - EQ
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
; 9 - PUSH constant 892
leaw $SP, %A
movw (%A), %A
decw %A
; 10 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 11 - LT
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
jl %D
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
; 12 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 13 - PUSH constant 892
leaw $SP, %A
movw (%A), %A
decw %A
; 14 - LT
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
jl %D
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
; 15 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 16 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 17 - LT
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
jl %D
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
; 18 - PUSH constant 32767
leaw $SP, %A
movw (%A), %A
decw %A
; 19 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 20 - GT
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
jg %D
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
; 21 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 22 - PUSH constant 32767
leaw $SP, %A
movw (%A), %A
decw %A
; 23 - GT
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
jg %D
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
; 24 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 25 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 26 - GT
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
jg %D
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
; 27 - PUSH constant 57
leaw $SP, %A
movw (%A), %A
decw %A
; 28 - PUSH constant 31
leaw $SP, %A
movw (%A), %A
decw %A
; 29 - PUSH constant 53
leaw $SP, %A
movw (%A), %A
decw %A
; 30 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
addw %S, %D, (%A)
; 31 - PUSH constant 112
leaw $SP, %A
movw (%A), %A
decw %A
; 32 - SUB
leaw $SP, %A
decw %A
movw (%A), %D
decw %A
movw (%A), %S
subw %D, %S, (%A)
; 33 - NEG
leaw $SP, %A
decw %A
movw (%A), %S
negw %S
movw %S, (%A)
; 34 - AND
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
andw (%A), %S, (%A)
; 35 - PUSH constant 82
leaw $SP, %A
movw (%A), %A
decw %A
; 36 - OR
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
orw (%A), %S, (%A)
; 37 - NEG
leaw $SP, %A
decw %A
movw (%A), %S
notw %S
movw %S, (%A)
; End
