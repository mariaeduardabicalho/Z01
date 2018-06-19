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
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $scripts/../../I-VM/src/vmExamples/StaticTest-8, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 4 - POP static 3
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $scripts/../../I-VM/src/vmExamples/StaticTest-3, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 5 - POP static 1
leaw $SP, %A
movw (%A), %A
decw %A
movw (%A), %D
leaw $LCL, %A
movw (%A), %S
leaw $scripts/../../I-VM/src/vmExamples/StaticTest-1, %A
addw %S, %A, %A
movw %D, (%A)
leaw $SP, %A
movw (%A), %A
decw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
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
