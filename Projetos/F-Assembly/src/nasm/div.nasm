; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

leaw $0, %A      ;atribui 0 a A
movw (%A), %D    ;Move o que esta em A[0] para D
WHILE:
leaw $1, %A      ;atribui 1 a A
subw  %D, (%A), %D      ;Faz D - A[1] e atribui a D
incw %S          ;add 1 em S
leaw $WHILE, %A
                 ;repete se D > 0
jg %D
nop
leaw $2, %A      ;atribui 2 a A
movw %S, (%A)    ;Move o que esta em S para A[2]

