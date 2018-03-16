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
from log import logLogiComb, logError

# Logic Comb
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+"/../../C-LogicaCombinacional/script/")
from testeLogicaCombinacional import tstLogiComb


class tstUla(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd,'../src/rtl/')
        self.tst = os.path.join(self.pwd,'../tests/')
        self.work = vhdlScript()

    def addSrc(self, work):
        work.addSrc(self.rtl)

    def addTst(self, work):
        work.addTstConfigFile(self.tst)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

if __name__ == "__main__":

    # Init ALU
    tstUla = tstUla()

    # Logica Combinacional RTL
    tstLogiComb = tstLogiComb()
    tstLogiComb.addSrc(tstUla.work)

    logLogiComb("---------- Portas Logicas            ")
    logLogiComb("---------- 04-Unidade-Logica-Aritmetica")
    tstUla.add(tstUla.work)
    tstUla.work.run()



