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

TOOLSPATH = os.path.dirname(os.path.abspath(__file__))+"/../../tools/"

sys.path.insert(0,TOOLSPATH+"scripts/")
from toMIF import toMIF
from assembler import assembler

jar = TOOLSPATH+"jar/Z01-Assembler.jar"

def compile(nasm, hack, mif):

    pwd = os.path.dirname(os.path.abspath(__file__))

    # global path
    os.path.abspath(nasm)
    os.path.abspath(hack)

    assembler(jar, nasm, hack, True)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--nasm" , required=True, help="arquivo nasm")
    ap.add_argument("-o", "--hack" , required=True, help="arquivo hack de saída")
    ap.add_argument("-m", "--mif" , help="gera o arquivo mif")
    args = vars(ap.parse_args())
    if(args["mif"]):
        mif = True
    else:
        mif = False
    root = os.getcwd()
    compile(nasm=args["nasm"], hack=args["hack"], mif=mif)
