; 0 - NEG
leaw $SP, %A
decw %A
movw (%A), %S
negw %S
movw %S, (%A)
; End
