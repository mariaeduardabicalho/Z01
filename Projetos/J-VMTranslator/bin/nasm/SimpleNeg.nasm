; 0 - NEG
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
neg %S
movw %S, (%A)
; End
