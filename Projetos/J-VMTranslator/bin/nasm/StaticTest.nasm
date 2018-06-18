; 0 - PUSH constant 111
leaw $SP, %A
movw (%A), %A
decw %A
; 1 - PUSH constant 333
leaw $SP, %A
movw (%A), %A
decw %A
; 2 - PUSH constant 888
leaw $SP, %A
movw (%A), %A
decw %A
; 3 - POP static 8
; 4 - POP static 3
; 5 - POP static 1
; 6 - PUSH static 3
; 7 - PUSH static 1
; 8 - SUB
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
subw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D, (%A)
; 9 - PUSH static 8
; 10 - ADD
leaw $SP,%A
movw (%A),%S
movw %S,%A
movw (%A),%S
decw %A
addw (%A),%S,%D
movw %D, (%A)
movw %A, %D
leaw $SP,%A
movw %D,(%A)
; End
