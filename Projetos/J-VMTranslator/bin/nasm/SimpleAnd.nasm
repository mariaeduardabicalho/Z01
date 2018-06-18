; 0 - AND
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
andw (%A), %S, (%A)
; End
