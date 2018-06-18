; 0 - LT
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
; End
