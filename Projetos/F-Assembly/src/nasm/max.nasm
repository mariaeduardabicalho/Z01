; Arquivo: Max.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; Log :
;     - Rafael Corsi portado para Z01

; Calcula R2 = max(R0, R1)  (R0,R1,R2 se referem a  RAM[0],RAM[1],RAM[2])
; ou seja, o maior valor que estiver, ou em R0 ou R1 sera copiado para R2
; Estamos considerando número inteiros

;faz o jump direto para o início
leaw $INIT, %A 
jmp
nop

;cria função da ram0
RAM0:
leaw $0, %A
movw (%A), %S
leaw $2, %A
movw %S, (%A)
leaw $PARAR, %A
jmp
nop

;cria função da ram1
RAM1:
leaw $1, %A
movw (%A), %S
leaw $2, %A
movw %S, (%A)
leaw $PARAR, %A
jmp
nop

;inicia código passando 0 pra A, armazenando em D,
;e passando 1 pra A
INIT:
leaw $0, %A
movw (%A), %D
leaw $1, %A

;realiza a subtração
subw %D, (%A), %D


;condição "if"
leaw $RAM0, %A
jg %D
nop

;condição "if"
leaw $RAM1, %A
jle %D
nop

;para o código
PARAR:
nop