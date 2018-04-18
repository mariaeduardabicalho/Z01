; math_determinante.nasm
; Calcula o determinante de uma matriz 3x3 (RAM[1000]) e
;  salva seu resultado no endereço RAM[0]
;
; Calcula o determinante de uma matriz 3x3 da forma
; [ a0, a1, a2 ]
; [ b0, b1, b2 ]
; [ c0, c1, c2 ]
;
; Salva na memória da seguinte maneira  :
; RAM[1000] = a0
; RAM[1001] = a1
; RAM[1002] = a2
; RAM[1003] = b0
; RAM[1004] = b1
; ....
;
; E salva o resultado em no endereço RAM[0]





