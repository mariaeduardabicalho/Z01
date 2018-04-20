; Arquivo: Pow.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Eleva ao quadrado o valor da RAM[1] e armazena o resultado na RAM[0].
; Só funciona com números positivos

leaw $R1,%A   ;atribui R1 a A
movw (%A),%D  ;Move o que esta em A[1] para D
leaw $R0,%S   ;atribui R0 a A
WHILE:
leaw $R1,%A   ;atribui R1 a A
addw (%A),%S,%S
decw %D
leaw $WHILE , %A
jg %D
nop
leaw $R0,%A    ;atribui R0 a A
movw %S,(%A)   ;Move o que esta em S para A[0]