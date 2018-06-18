; 0 - PUSH constant 5
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 3
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - POP temp 0
; End
