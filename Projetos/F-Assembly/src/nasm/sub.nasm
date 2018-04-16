; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].

;passa valor 0 para A
leaw $0, %A
;passa o valor de ram0 para S
movw (%A), %S
;passa o valor 1 para A
leaw $1, %A
;subtrai o valor da ram1 pelo da ram0 e o coloca em D
subw (%A), %S, %D
;passa o valor 2 para A
leaw $2, %A
;passa o valor de D para ram2
movw %D, (%A)
