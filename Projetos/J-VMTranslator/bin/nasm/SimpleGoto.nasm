; 0 - PUSH constant 5
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 3
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - POP temp 0
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
movw %A, %S
leaw $SP, %A
leaw $0, %A
movw %A, %S
leaw $5, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; End
