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

def testeAssembly(jar, testDir, nasmDir, hackDir, gui, verbose):

    pwd = os.path.dirname(os.path.abspath(__file__))

    # global path
    os.path.abspath(nasm)
    os.path.abspath(hack)

    # compila
    print("-------------------------")
    print("- Assembling files .... " )
    print("-------------------------")
    assembler(jar, nasm, hack, True) 


    # simulando
    print("-------------------------")
    print("- Simulating .... ")
    print("-------------------------")
    simulateFromTestDir(testDir, hackDir, gui, verbose)

    # testAssembling files
    print("-------------------------")
    print("- Testando .... ")
    print("-------------------------")
    compareFromTestDir(testDir)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-c", "--testDir", help="lista de arquivos a serem testados")
    ap.add_argument("-v", "--verbose", help="log simulacao", action='store_true')
    ap.add_argument("-g", "--gui", help="carrega model sim", action='store_true')
    args = vars(ap.parse_args())

    pwd = os.path.dirname(os.path.abspath(__file__))
    if args["testDir"] is None:
            testDir = pwd+"/../tests/"
    else:
            testDir = args["testDir"]

    if args["verbose"]:
        verbose = True
    else:
        verbose = False

    if args["gui"]:
        gui = True
    else:
        gui = False

    nasm = pwd+"/../src/nasm/"
    hack = pwd+"/../bin/hack/"

    jar = TOOLSPATH+"jar/Z01-Assembler.jar"
    testeAssembly(jar=jar, testDir=testDir, nasmDir=nasm, hackDir=hack, gui=gui, verbose=verbose)

