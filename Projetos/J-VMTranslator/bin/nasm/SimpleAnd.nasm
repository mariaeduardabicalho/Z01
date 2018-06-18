; 0 - AND
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
; End
