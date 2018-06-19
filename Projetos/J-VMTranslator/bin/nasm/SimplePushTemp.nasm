; 0 - PUSH temp 0
leaw $0, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 1 - PUSH temp 1
leaw $1, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 2 - PUSH temp 2
leaw $2, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 3 - PUSH temp 3
leaw $3, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 4 - PUSH temp 4
leaw $4, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 5 - PUSH temp 5
leaw $5, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 6 - PUSH temp 6
leaw $6, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; 7 - PUSH temp 7
leaw $7, %A
movw %A, %S
leaw $5 ,%A
addw %S, %A, %A
movw (%A), %S
leaw $SP, %A
movw (%A), %A
movw %S, (%A)
incw %A
movw %A, %S
leaw $SP, %A
movw %S, (%A)
; End
