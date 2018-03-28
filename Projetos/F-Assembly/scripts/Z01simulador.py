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

SIMULATOR = os.path.dirname(os.path.abspath(__file__))+"/../../tools/Z01-Simulator-GUI/"

if __name__ == "__main__":
    root = os.getcwd()
    os.chdir(SIMULATOR)
    os.system('python main.py')
