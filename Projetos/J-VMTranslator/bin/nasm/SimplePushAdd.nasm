; 0 - PUSH constant 5
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH constant 9
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - ADD
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
decw %A
addw %D, (%A), %S
movw %S, (%A)
incw %A
movw %A, %D
leaw $SP, %A
movw %D, (%A)
; End
