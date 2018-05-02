# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas
#
# script para gerar hack a partir de nasm
# suporta como entrada um único arquivo
# ou um diretório
# Possibilita também a geração do .mif

import os,sys
import argparse


# Scripts python
TOOLSPATH = os.path.dirname(os.path.abspath(__file__))+"/../../tools/"
sys.path.insert(0,TOOLSPATH+"scripts/")
from toMIF import toMIF
from assembler import assembler
from testeAssembly import compareRam, compareFromTestDir
from simulateCPU import simulateFromTestDir

def compileNASM(jar, nasmDir, hackDir):

    # compila
    print("-------------------------")
    print("- Assembling files .... " )
    print("-------------------------")
    assembler(jar, nasm, hack, True) 


if __name__ == "__main__":
    pwd = os.path.dirname(os.path.abspath(__file__))

    nasm = pwd+"/../bin/nasm/"
    hack = pwd+"/../bin/hack/"

    jar = TOOLSPATH+"jar/Z01-Assembler.jar"
    compileNASM(jar=jar, nasmDir=nasm, hackDir=hack)

