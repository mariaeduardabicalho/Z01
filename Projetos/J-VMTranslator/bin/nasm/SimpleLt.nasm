; 0 - LT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lblcc4dd00afeaf2256317f,%A
jl %S
nop
leaw $0,%A
movw %A,%D
leaw $lbla314838ed9fea77a76a1,%A
jmp
nop
lblcc4dd00afeaf2256317f:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbla314838ed9fea77a76a1,%A
jmp
nop
lbla314838ed9fea77a76a1:
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
; End
