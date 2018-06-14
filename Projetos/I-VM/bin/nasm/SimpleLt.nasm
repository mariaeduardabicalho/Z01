; 0 - LT
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
subw (%A),%D,%D
leaw $LTscripts/../src/vmExamples/SimpleLt0,%A
jl %D
nop
leaw $SP,%A
subw (%A),$1,%A
movw $0,(%A)
leaw $LT2scripts/../src/vmExamples/SimpleLt0,%A
jmp
nop
LTscripts/../src/vmExamples/SimpleLt0:
leaw $SP,%A
subw (%A),$1,%A
movw $-1,(%A)
LT2scripts/../src/vmExamples/SimpleLt0:
; End
