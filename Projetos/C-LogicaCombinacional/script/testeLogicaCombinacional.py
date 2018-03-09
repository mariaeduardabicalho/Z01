#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Adaptado de :     Pedro Cunial   <pedrocc4@al.insper.edu.br>
#                   Luciano Soares <lpsoares@insper.edu.br>
# Data de criação: 07/2017

from os.path import join, dirname
import sys
import os
import shutil

# para printf coloridos
from termcolor import colored

# Scripts python
TOOLSPATH = os.path.dirname(os.path.abspath(__file__))+"/../../tools/"
sys.path.insert(0,TOOLSPATH+"scripts/")
from testeVHDL import vhdlScript
from log import logLogiComb

class tstLogiComb(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd,'../src/rtl/')
        self.tst = os.path.join(self.pwd,'../tests/tst/')
        self.work = vhdlScript()

    def addSrc(self, work):
        work.addSrc(self.rtl)

    def addTst(self, work):
        work.addSrc(self.tst)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

    def print(self):
        logLogiComb("---------- Portas Logicas            ")
        logLogiComb("---------- 03-Logica-Combinacional   ")

if __name__ == "__main__":
    tstLogiComb = tstLogiComb()
    tstLogiComb.print();
    tstLogiComb.add(tstLogiComb.work)
    tstLogiComb.work.run()



