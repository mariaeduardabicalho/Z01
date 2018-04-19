; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $1, %A
movw $1, (%A) ; guarda f em R1
FAT:

COMECO:
leaw $1, %A
movw (%A), %S 
leaw $0, %A
movw (%A), %D
leaw $7, %A
movw %D, (%A)
leaw $ZERO, %A
decw %S
je %S
nop
je %D
nop

MEIO:
nop
leaw $7, %A
movw (%A), %A
addw %D, %A, %D
leaw %3, %ASS
movw %D, (%A)
decw %S
leaw %MEIO, %A
jg %S
nop
leaw %FIM, %A
je %S
nop


ZERO:
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
