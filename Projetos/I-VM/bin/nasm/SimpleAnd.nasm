; 0 - AND
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
andw (%A),%D,%D
movw %D,(%A)
; End
