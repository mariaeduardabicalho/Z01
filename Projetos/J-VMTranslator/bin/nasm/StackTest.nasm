; 0 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $eqlabelt, %A
je %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $eqlabelf, %A
jmp 
nop
eqlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 3 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 4 - PUSH constant 16
leaw $SP, %A
movw (%A), %A
decw %A
; 5 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $eqlabelt, %A
je %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $eqlabelf, %A
jmp 
nop
eqlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 6 - PUSH constant 16
leaw $SP, %A
movw (%A), %A
decw %A
; 7 - PUSH constant 17
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - EQ
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $eqlabelt, %A
je %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $eqlabelf, %A
jmp 
nop
eqlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 9 - PUSH constant 892
leaw $SP, %A
movw (%A), %A
decw %A
; 10 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 11 - LT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $ltlabelt, %A
jl %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $ltlabelf, %A
jmp 
nop
ltlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
ltlabelf
; 12 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 13 - PUSH constant 892
leaw $SP, %A
movw (%A), %A
decw %A
; 14 - LT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $ltlabelt, %A
jl %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $ltlabelf, %A
jmp 
nop
ltlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
ltlabelf
; 15 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 16 - PUSH constant 891
leaw $SP, %A
movw (%A), %A
decw %A
; 17 - LT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $ltlabelt, %A
jl %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $ltlabelf, %A
jmp 
nop
ltlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
ltlabelf
; 18 - PUSH constant 32767
leaw $SP, %A
movw (%A), %A
decw %A
; 19 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 20 - GT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $gtlabelt, %A
jg %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $gtlabelf, %A
jmp 
nop
gtlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 21 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 22 - PUSH constant 32767
leaw $SP, %A
movw (%A), %A
decw %A
; 23 - GT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $gtlabelt, %A
jg %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $gtlabelf, %A
jmp 
nop
gtlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
; 24 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 25 - PUSH constant 32766
leaw $SP, %A
movw (%A), %A
decw %A
; 26 - GT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
leaw $gtlabelt, %A
jg %D
nop
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $0, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
leaw $gtlabelf, %A
jmp 
nop
gtlabelt
leaw $SP,%A
movw (%A),%S
movw %S,%A
incw %A
leaw $-1, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
eqlabelf
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
; 31 - PUSH constant 112
leaw $SP, %A
movw (%A), %A
decw %A
; 32 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 33 - NEG
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
neg %S
movw %S, (%A)
; 34 - AND
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
andw (%A), %S, %D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 35 - PUSH constant 82
leaw $SP, %A
movw (%A), %A
decw %A
; 36 - OR
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
orw (%A), %S, %D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 37 - NOT
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
notw %S
movw %S, (%A)
; End
