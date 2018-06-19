; 0 - NEG
leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
negw %S
movw %S, (%A)
; End
