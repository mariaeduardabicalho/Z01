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

# Scripts python
TOOLSPATH = os.path.dirname(os.path.abspath(__file__))+"/../../tools/"
sys.path.insert(0,TOOLSPATH+"scripts/")
from testeVHDL import vhdlScript
from log import logLogiComb

# Logic Comb
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+"/../../C-LogicaCombinacional/script/")
from testeLogicaCombinacional import tstLogiComb

# ULA
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+"/../../D-UnidadeLogicaAritmetica/script/")
from testeULA import tstUla


class tstLogiSeq(object):

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
    tstLogiSeq = tstLogiSeq()

    # Logica Combinacional RTL
    tstLogiComb = tstLogiComb()
    tstLogiComb.addSrc(tstLogiSeq.work)

    # ULA
    tstUla = tstUla()
    tstUla.addSrc(tstLogiSeq.work)

    # Logica Sequencial
    logLogiComb("---------- E-Logica-Sequencial")
    tstLogiSeq.add(tstLogiSeq.work)
    tstLogiSeq.work.run()



