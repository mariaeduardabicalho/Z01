leaw $1, %A
movw (%A), %D
leaw $2, %A
movw (%A), %S
nop
DINC:
decw %D
decw %S
leaw $FIM, %A
je %D
nop
leaw $PROXDIV, %A
je %S
nop
leaw $DINC, %A
jne %S
nop
PROXDIV:
leaw $2, %A
movw (%A), %S
leaw $DINC, %A
jmp
nop
FIM:
leaw $RESTO, %A
jne %S
nop
leaw $NRESTO, %A
je %S
nop
RESTO:
leaw $2, %A
subw (%A),%S,%D
leaw $0, %A
movw %D, (%A)
leaw $TERMINA, %A
jmp
nop
NRESTO:
leaw $0, %A
movw $0, (%A)
TERMINA:
nop

























































