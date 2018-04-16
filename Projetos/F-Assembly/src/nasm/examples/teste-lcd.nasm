movw $0, %S
decw $S
negw %S
leaw $16384, %A
movw %S, (%A)