; 0 - PUSH constant 5
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH constant 15
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 15
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - EQ
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
je %D
nop
leaw $0, %A
movw %A, %D
movw %S, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
TRUE:
leaw $0, %A
movw %A, %D
movw %S, %A
neg %D
movw %D, (%A)
END:
; 5 - PUSH constant 3
leaw $SP, %A
movw (%A), %A
decw %A
; 6 - POP temp 0
; 7 - PUSH constant 15
leaw $SP, %A
movw (%A), %A
decw %A
; 8 - PUSH constant 9
leaw $SP, %A
movw (%A), %A
decw %A
; 9 - EQ
leaw $SP, %A
decw %A
movw (%A), %S
decw %A
movw (%A), %D
subw %D, %S, %D
movw %A, %S
leaw $TRUE, %A
je %D
nop
leaw $0, %A
movw %A, %D
movw %S, %A
movw %D, (%A)
leaw $END, %A
jmp
nop
TRUE:
leaw $0, %A
movw %A, %D
movw %S, %A
neg %D
movw %D, (%A)
END:
; 11 - PUSH constant 2
leaw $SP, %A
movw (%A), %A
decw %A
; 12 - POP temp 1
; End
