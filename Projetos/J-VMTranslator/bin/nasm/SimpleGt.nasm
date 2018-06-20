; 0 - GT
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %A, %S, %S
leaw $lbl18c6a28f82c9f6612117,%A
jg %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl97ddc1479c140f6cc1da,%A
jmp
nop
lbl18c6a28f82c9f6612117:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl97ddc1479c140f6cc1da,%A
jmp
nop
lbl97ddc1479c140f6cc1da:
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
