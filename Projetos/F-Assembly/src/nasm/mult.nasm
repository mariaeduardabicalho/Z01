; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

;Carrega os dois valores a serem multiplicados nos registradores S e D e verifica se algum deles e zero
leaw $0, %A
movw (%A), %S
leaw $1, %A
movw (%A), %D
leaw $ZERO, %A
je %S
nop
je %D
nop

;Realiza o looping de multiplicacao
LOOPING:
decw %D
leaw %FIM, %A
je %D
nop
leaw $0, %A
addw (%A), %S, %S
leaw %LOOPING, %A
jmp
nop

ZERO:
leaw $0, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)
leaw $NOPE, %A
jmp
nop

FIM:
leaw %3, %A
movw %S, (%A)

NOPE:
<<<<<<< HEAD
nop
=======
nop
>>>>>>> a8721f3a03590bd7f257ca39a9a44294d543dd49
