; 0 - PUSH constant 17
leaw $17, %A
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
; 1 - PUSH constant 17
leaw $17, %A
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
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %S, %A, %S
leaw $lblf79686a843f1c2f768a0,%A
je %S
nop
leaw $0,%A
movw %A,%D
leaw $lblb0a8b6b5d82d8bd863f6,%A
jmp
nop
lblf79686a843f1c2f768a0:
leaw $1,%A
negw %A
movw %A,%D
leaw $lblb0a8b6b5d82d8bd863f6,%A
jmp
nop
lblb0a8b6b5d82d8bd863f6:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 2 - PUSH constant 17
leaw $17, %A
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
; 3 - PUSH constant 16
leaw $16, %A
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
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %S, %A, %S
leaw $lbl9293a739aace3dee082c,%A
je %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl5b07707946ca5e70943d,%A
jmp
nop
lbl9293a739aace3dee082c:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl5b07707946ca5e70943d,%A
jmp
nop
lbl5b07707946ca5e70943d:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 4 - PUSH constant 16
leaw $16, %A
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
; 5 - PUSH constant 17
leaw $17, %A
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
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %S, %A, %S
leaw $lbl59cfaba4fe6dda9add1f,%A
je %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl8f7487f47c7b3bfd9bc,%A
jmp
nop
lbl59cfaba4fe6dda9add1f:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl8f7487f47c7b3bfd9bc,%A
jmp
nop
lbl8f7487f47c7b3bfd9bc:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 6 - PUSH constant 892
leaw $892, %A
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
; 7 - PUSH constant 891
leaw $891, %A
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
; 8 - LT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lbleaac4974dac7919ce6a4,%A
jl %S
nop
leaw $0,%A
movw %A,%D
leaw $lbldb8395d783f69760bfcd,%A
jmp
nop
lbleaac4974dac7919ce6a4:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbldb8395d783f69760bfcd,%A
jmp
nop
lbldb8395d783f69760bfcd:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 9 - PUSH constant 891
leaw $891, %A
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
; 10 - PUSH constant 892
leaw $892, %A
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
; 11 - LT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lbl9e9252d120ec23902828,%A
jl %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl83fbc553e4ee83055cc9,%A
jmp
nop
lbl9e9252d120ec23902828:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl83fbc553e4ee83055cc9,%A
jmp
nop
lbl83fbc553e4ee83055cc9:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 12 - PUSH constant 891
leaw $891, %A
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
; 13 - PUSH constant 891
leaw $891, %A
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
; 14 - LT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lbl8735197f34aedd4e68c4,%A
jl %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl53d8efd9c9918779c701,%A
jmp
nop
lbl8735197f34aedd4e68c4:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl53d8efd9c9918779c701,%A
jmp
nop
lbl53d8efd9c9918779c701:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 15 - PUSH constant 32767
leaw $32767, %A
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
; 16 - PUSH constant 32766
leaw $32766, %A
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
; 17 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lbl74e3e406e496cde3ecb7,%A
jg %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl19baa386a24535e4537d,%A
jmp
nop
lbl74e3e406e496cde3ecb7:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl19baa386a24535e4537d,%A
jmp
nop
lbl19baa386a24535e4537d:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 18 - PUSH constant 32766
leaw $32766, %A
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
; 19 - PUSH constant 32767
leaw $32767, %A
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
; 20 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lblfa120e4e6fb67e34d88b,%A
jg %S
nop
leaw $0,%A
movw %A,%D
leaw $lblc37c9104406e2e9e9085,%A
jmp
nop
lblfa120e4e6fb67e34d88b:
leaw $1,%A
negw %A
movw %A,%D
leaw $lblc37c9104406e2e9e9085,%A
jmp
nop
lblc37c9104406e2e9e9085:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 21 - PUSH constant 32766
leaw $32766, %A
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
; 22 - PUSH constant 32766
leaw $32766, %A
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
; 23 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lbl3f3ec9433e8122320cff,%A
jg %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl2eb7b83bd93393c5cbca,%A
jmp
nop
lbl3f3ec9433e8122320cff:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl2eb7b83bd93393c5cbca,%A
jmp
nop
lbl2eb7b83bd93393c5cbca:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 24 - PUSH constant 57
leaw $57, %A
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
; 25 - PUSH constant 31
leaw $31, %A
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
; 26 - PUSH constant 53
leaw $53, %A
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
; 27 - ADD
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
; 28 - PUSH constant 112
leaw $112, %A
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
; 29 - SUB
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
; 30 - NEG
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
negw %S
movw %S, (%A)
; 31 - AND
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
andw %S, (%A), %D
movw %D, (%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 32 - PUSH constant 82
leaw $82, %A
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
; 33 - OR
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %S
decw %A
orw (%A),%S,%D
movw %D, (%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; 34 - NOT
leaw $SP, %A
movw (%A), %S
decw %S
movw %S, %A
movw (%A), %S
notw, %S
movw %S, (%A)
; End
