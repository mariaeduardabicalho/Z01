; 0 - AND
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
andw (%A),%S,%D
movw %A,%S
incw %S
leaw $SP,%A
movw %S,(%A)
; End
