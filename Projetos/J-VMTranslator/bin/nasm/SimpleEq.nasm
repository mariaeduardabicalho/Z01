; 0 - EQ
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
; End
