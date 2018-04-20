; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[1] pelo número posicionado no RAM[2] e armazena o resultado na RAM[0].

; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide o número posicionado na RAM[1] pelo número posicionado no RAM[2] e armazena o resultado na RAM[0].


;passa valor de r1 para D e de r2 para S
leaw $1, %A
movw (%A), %D
leaw $2, %A
movw (%A), %S
nop

;(Na divisao vc vai tirando do numero que esta sendo dividido 1  vezes a quantidade do dividendo, ate 
; nao conseguir tirar exatamente essa quantia - que sera o resto , ou tirar exatamente essa quantia que assim nao tera resto)

; Tira 1 do valor de S e D, e depois verica se D é 0- para ir para o final( divisao acabou), se S é 0- Pra voltar S para seu valor antigo e 
;depois se S é != 0 para voltar para DINC 

DINC:
decw %D
decw %S
leaw $FIM, %A
je %D
nop
leaw $PROXDIV, %A
je %S
nop
leaw $DINC, %A
jne %S
nop

; Volta para DINC com S tendo o  seu valor inicial

PROXDIV:
leaw $2, %A
movw (%A), %S
leaw $DINC, %A
jmp
nop

; Verica se a divisao teve resto

FIM:
leaw $RESTO, %A
jne %S
nop
leaw $NRESTO, %A
je %S
nop

; Se tiver resto, subtrai o valor inicial de S pelo seu final -assim tera exatamente o que restou que nao completou uma divisao final.
; e depois coloca na r0 

RESTO:
leaw $2, %A
subw (%A),%S,%D
leaw $0, %A
movw %D, (%A)
leaw $TERMINA, %A
jmp
nop

; Se nao tiver resto coloca 0 na r0
NRESTO:
leaw $0, %A
movw $0, (%A)

; para o resto nao passar pelo NRESTO 
TERMINA:
nop
