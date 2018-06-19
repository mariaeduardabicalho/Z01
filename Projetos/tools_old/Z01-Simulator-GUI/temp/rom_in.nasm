leaw $1, %A
movw $1, (%A) ; guarda f em R1
FAT:
COMECO: ; salva os dois valores a serem multiplicados, um em um registrador e outro em uma RAM
leaw $1, %A
movw (%A), %S
leaw $0, %A
movw (%A), %D
leaw $7, %A
movw %D, (%A)
leaw $ZERO, %A
decw %S
je %S ;checa se um dos numeros é 0, se for ja salva 0 na ram 3
nop
je %D
nop
MEIO: ; soma um dos valores o número de vezes do segundo valor
nop
leaw $7, %A
movw (%A), %A
addw %D, %A, %D
leaw %3, %A
movw %D, (%A)
decw %S
leaw %MEIO, %A
jg %S
nop
leaw %FIM, %A
je %S
nop
ZERO: ; salva 0 na ram
leaw $3, %A
leaw $0, (%A)
nop
FIM:
nop
leaw $3, %A
movw (%A), %S
leaw $1, %A
movw %S, (%A) ;Atualiza f
leaw $0, %A
decw (%A) ; n-1
movw (%A), %D
leaw %FAT, %A
jne %D
nop























































































































































































































