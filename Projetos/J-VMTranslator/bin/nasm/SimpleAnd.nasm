; 0 - AND
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
; End
