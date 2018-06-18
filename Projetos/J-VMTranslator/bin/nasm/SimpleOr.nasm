; 0 - OR
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
orw (%A), %S, (%A)
; End
