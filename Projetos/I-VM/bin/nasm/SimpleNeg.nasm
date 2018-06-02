; 0 - NEG
leaw $SP,%A
subw (%A),$1,%A
movw (%A),%D
negw %D
movw %D,(%A)
; End
