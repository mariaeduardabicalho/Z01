; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $1, %A
movw $1, (%A) ; guarda f em R1
leaw $0, %A
movw (%A), %S
leaw $5, %A
movw %S,(%A)

FAT:
; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

<<<<<<< HEAD
; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

=======
>>>>>>> a8721f3a03590bd7f257ca39a9a44294d543dd49
;Carrega os dois valores a serem multiplicados nos registradores S e D e verifica se algum deles e zero
leaw $5, %A
movw (%A), %S
leaw $0, %A
movw %S, (%A)
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
<<<<<<< HEAD
nop

ZERO:
leaw $0, %A
movw %A, %D
leaw $3, %A
movw %D, (%A)
leaw $NOPE, %A
jmp
=======
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
>>>>>>> a8721f3a03590bd7f257ca39a9a44294d543dd49
nop

FIM:
leaw %3, %A
movw %S, (%A)

NOPE:
nop

leaw $3, %A
movw (%A), %S
leaw $1, %A
movw %S, (%A) ;Atualiza f
leaw $5, %A

decw (%A) ; n-1
movw (%A), %D
leaw %FAT, %A
jne %D
nop
