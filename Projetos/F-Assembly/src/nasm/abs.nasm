; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Copia o valor de RAM[1] para RAM[0] deixando o valor sempre positivo.

leaw $1, %A
movw (%A), %S ; salva o que esta na RAM
leaw $MENOR, %A
jl %S ; checa se o número é negativo, se for pula para MENOR
nop
leaw $0, %A
movw %S, (%A) ;salva na ram
leaw $FIM, %A
jmp
nop

MENOR:
negw %S
leaw $0, %A
movw %S, (%A) ; salva na ram

FIM:
nop