; Inicialização para VM
leaw $Main.main, %A
jmp
nop
; 0 - Declarando função Class1.set
Class1.set:
; 1 - PUSH argument 0
leaw $0,%A
movw %A,%D
leaw $ARG,%A
addw (%A),%D,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 2 - POP static 0
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $Class1.0,%A
movw %D,(%A)
; 3 - PUSH argument 1
leaw $1,%A
movw %A,%D
leaw $ARG,%A
addw (%A),%D,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 4 - POP static 1
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $Class1.1,%A
movw %D,(%A)
; 5 - PUSH constant 0
leaw $0,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 6 - Retorno de função
; Retorno de função 
leaw $LCL,%A
movw (%A),%D
leaw $R13,%A
movw %D,(%A)
leaw $5,%A
subw %D,%A,%A
movw (%A),%D
leaw $R14,%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $R15,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $R15,%A
movw (%A),%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
addw %D,$1,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THAT,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THIS,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $ARG,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $R14,%A
movw (%A),%A
jmp
nop
; 7 - Declarando função Class1.get
Class1.get:
; 8 - PUSH static 0
leaw $Class1.0,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 9 - PUSH static 1
leaw $Class1.1,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 10 - SUB
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
subw (%A),%D,%D
movw %D,(%A)
; 11 - Retorno de função
; Retorno de função 
leaw $LCL,%A
movw (%A),%D
leaw $R13,%A
movw %D,(%A)
leaw $5,%A
subw %D,%A,%A
movw (%A),%D
leaw $R14,%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $R15,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $R15,%A
movw (%A),%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
addw %D,$1,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THAT,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THIS,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $ARG,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $R14,%A
movw (%A),%A
jmp
nop
; End
; 12 - Declarando função Class2.set
Class2.set:
; 13 - PUSH argument 0
leaw $0,%A
movw %A,%D
leaw $ARG,%A
addw (%A),%D,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 14 - POP static 0
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $Class2.0,%A
movw %D,(%A)
; 15 - PUSH argument 1
leaw $1,%A
movw %A,%D
leaw $ARG,%A
addw (%A),%D,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 16 - POP static 1
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $Class2.1,%A
movw %D,(%A)
; 17 - PUSH constant 0
leaw $0,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 18 - Retorno de função
; Retorno de função 
leaw $LCL,%A
movw (%A),%D
leaw $R13,%A
movw %D,(%A)
leaw $5,%A
subw %D,%A,%A
movw (%A),%D
leaw $R14,%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $R15,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $R15,%A
movw (%A),%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
addw %D,$1,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THAT,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THIS,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $ARG,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $R14,%A
movw (%A),%A
jmp
nop
; 19 - Declarando função Class2.get
Class2.get:
; 20 - PUSH static 0
leaw $Class2.0,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 21 - PUSH static 1
leaw $Class2.1,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 22 - SUB
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $SP,%A
subw (%A),$1,%A
subw (%A),%D,%D
movw %D,(%A)
; 23 - Retorno de função
; Retorno de função 
leaw $LCL,%A
movw (%A),%D
leaw $R13,%A
movw %D,(%A)
leaw $5,%A
subw %D,%A,%A
movw (%A),%D
leaw $R14,%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $R15,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $R15,%A
movw (%A),%A
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
addw %D,$1,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THAT,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $THIS,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $ARG,%A
movw %D,(%A)
leaw $R13,%A
subw (%A),$1,%D
movw %D,(%A)
movw %D,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $R14,%A
movw (%A),%A
jmp
nop
; End
; 24 - Declarando função Main.main
Main.main:
; 25 - PUSH constant 6
leaw $6,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 26 - PUSH constant 8
leaw $8,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 27 - chamada de funcao Class1.set
leaw $Class1.set.ret.1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $LCL,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THIS,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THAT,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $7,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
subw %A,%D,%D
leaw $ARG,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $Class1.set,%A
jmp
nop
Class1.set.ret.1:
; 28 - POP temp 0
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $5,%A
movw %D,(%A)
; 29 - PUSH constant 23
leaw $23,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 30 - PUSH constant 15
leaw $15,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
; 31 - chamada de funcao Class2.set
leaw $Class2.set.ret.1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $LCL,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THIS,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THAT,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $7,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
subw %A,%D,%D
leaw $ARG,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $Class2.set,%A
jmp
nop
Class2.set.ret.1:
; 32 - POP temp 0
leaw $SP,%A
movw (%A),%D
decw %D
movw %D,(%A)
movw (%A),%A
movw (%A),%D
leaw $5,%A
movw %D,(%A)
; 33 - chamada de funcao Class1.get
leaw $Class1.get.ret.1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $LCL,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THIS,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THAT,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $5,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
subw %A,%D,%D
leaw $ARG,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $Class1.get,%A
jmp
nop
Class1.get.ret.1:
; 34 - chamada de funcao Class2.get
leaw $Class2.get.ret.1,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $LCL,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $ARG,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THIS,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $THAT,%A
movw (%A),%D
leaw $SP,%A
movw (%A),%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
incw %D
movw %D,(%A)
leaw $5,%A
movw %A,%D
leaw $SP,%A
movw (%A),%A
subw %A,%D,%D
leaw $ARG,%A
movw %D,(%A)
leaw $SP,%A
movw (%A),%D
leaw $LCL,%A
movw %D,(%A)
leaw $Class2.get,%A
jmp
nop
Class2.get.ret.1:
; Label (marcador)
Sys.Main.main.WHILE:
; 35 - Goto Incondicional
leaw $Sys.Main.main.WHILE,%A
jmp
nop
; End
