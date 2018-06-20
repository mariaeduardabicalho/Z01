; 0 - OR
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
; End
