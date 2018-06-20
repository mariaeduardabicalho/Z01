leaw $SP,%A
movw (%A),%A
decw %A
movw (%A),%S
decw %A
movw (%A),%A
subw %S, %A, %S
leaw $lbl980c116bc2e720fbaa5b,%A
je %S
nop
leaw $0,%A
movw %A,%D
leaw $lbl8d05bdf414195a908183,%A
jmp
nop
lbl980c116bc2e720fbaa5b:
leaw $1,%A
negw %A
movw %A,%D
leaw $lbl8d05bdf414195a908183,%A
jmp
nop
lbl8d05bdf414195a908183:
leaw $SP,%A
movw (%A),%A
decw %A
decw %A
movw %D,(%A)
leaw $SP,%A
movw (%A), %D
decw %D
leaw $SP,%A
movw %D,(%A)
; End
