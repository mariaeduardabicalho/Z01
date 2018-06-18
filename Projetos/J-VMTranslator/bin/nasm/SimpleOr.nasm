; 0 - OR
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
; End
