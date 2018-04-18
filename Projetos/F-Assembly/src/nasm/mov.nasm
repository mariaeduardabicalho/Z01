; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

leaw $1, %A ;define A como 1
movw (%A), %S ;guarda o valor da RAM 1 em S
leaw $0, %A
movw (%A), %D ;guarda o valor da RAM 0 em D
movw %S, (%A) ;guarda o valor da RAM 1 em RAM 0
leaw $1, %A
movw %D, (%A) ;guada o valor de D(RAM 0 antiga) na RAM 1
movw %A, %S ; define S como 1
leaw $3, %A
movw %S, (%A) ; guarda 1 na RAM3
