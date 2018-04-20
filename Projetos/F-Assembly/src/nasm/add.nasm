; Arquivo: add.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
; 2018 @ Rafael Corsi

; Adicione o valor de RAM[1] com RAM[0] gravando em RAM[2].


leaw $R1,%A       ;atribui R1 a A
movw (%A),%S     ;Move o que esta em A[1] para S
leaw $R0,%A      ;atribui R0 a A
addw %S,(%A),%D  ;D fica igual a S mais ram[A]
leaw $R2,%A      ;atribui R2 a A
movw %D,(%A)     ;Move o que esta em D para A[3]