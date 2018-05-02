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


def compileVM(jar):

    pwd = os.path.dirname(os.path.abspath(__file__))
    vmDir = pwd+"/../src/vm/"
    nasmDir = pwd+"/../bin/nasm/"

    # compila
    print("------------------------------")
    print("- Translating files           ")
    print("- to I-VMTranslator/bin/nasm/ ")
    print("------------------------------")
    vmtranslator(vmDir, nasmDir, jar=jar)


if __name__ == "__main__":
    #jar = os.path.abspath("../Assembler/Z01-Assembler.jar")
    jar = os.path.abspath("../VMtranslator/Z01-VMTranslator.jar")
    compileVM(jar=jar)

