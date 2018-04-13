# -*- coding: utf-8 -*-
# Rafael Corsi @ insper.edu.br
# Abril/2018
# Disciplina Elementos de Sistemas
#
# Script para compilar e gravar um programa
# na FPGA.

import os
import sys
import argparse

TOOLSPATH = os.path.dirname(os.path.abspath(__file__))+"/../../tools/"

sys.path.insert(0,TOOLSPATH+"scripts/")
from assembler import assembler
from writeROM import writeROM

jar = TOOLSPATH+"jar/Z01-Assembler.jar"

def program(nasm):

    pwd = os.path.dirname(os.path.abspath(__file__))
    hack = pwd+"/../bin/hack/"+os.path.splitext(os.path.basename(nasm))[0]

    # global path
    nasm = os.path.abspath(nasm)
    hack = os.path.abspath(hack)

    # assembler
    assembler(jar, nasm, hack, True)

    # program ROM
    writeROM(hack+".mif")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--nasm", required=True, help="arquivo nasm")
    args = vars(ap.parse_args())
    program(nasm=args["nasm"])
