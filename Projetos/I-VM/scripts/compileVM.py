# 
# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas

import os,sys
import argparse

# Scripts python
TOOLSPATH = os.path.dirname(os.path.abspath(__file__))+"/../../tools/"
sys.path.insert(0,TOOLSPATH+"scripts/")
from vmtranslator import vmtranslator


def compileVM(bootstrap, jar):

    pwd = os.path.dirname(os.path.abspath(__file__))
    vmDir = pwd+"/../src/vm/"
    vmExDir = pwd+"/../src/vmExamples/"
    nasmDir = pwd+"/../bin/nasm/"

    # compila
    print("------------------------------")
    print("- Translating Examples files  ")
    print("- to I-VMTranslator/bin/nasm/ ")
    print("------------------------------")
    vmtranslator(bootstrap, vmExDir, nasmDir, jar=jar)

    print("------------------------------")
    print("- Translating src files       ")
    print("- to I-VMTranslator/bin/nasm/ ")
    print("------------------------------")
    vmtranslator(bootstrap, vmDir, nasmDir, jar=jar)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-b", "--bootstrap", help="insere inicialização do sistema", action='store_true')
    args = vars(ap.parse_args())

    if args["bootstrap"]:
        bs = True
    else:
        bs = False

    jar = os.path.abspath(TOOLSPATH + "jar/Z01-VMTranslator.jar")
    compileVM(bootstrap=bs, jar=jar)


