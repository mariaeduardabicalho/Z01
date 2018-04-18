; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos


leaw $0, %A
movw (%A), %D

WHILE:
leaw $1, %A
subw  %D, (%A), %D
incw %S
leaw $WHILE, %A
jg %D
nop
leaw $2, %A
movw %S, (%A)
