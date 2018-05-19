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

# Logic Comb
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+"/../../C-LogicaCombinacional/script/")
from testeLogicaCombinacional import tstLogiComb

# ULA
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+"/../../D-UnidadeLogicaAritmetica/script/")
from testeULA import tstUla

# ULA
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__))+"/../../E-LogicaSequencial/script/")
from testeLogicaSequencial import tstLogiSeq


class tstControlUnit(object):

    def __init__(self):
        self.pwd = os.path.dirname(os.path.abspath(__file__))
        self.rtl = os.path.join(self.pwd, '../src/rtl/')
        self.tst = os.path.join(self.pwd, '../tests/vhd/')
        self.work = vhdlScript()

    def addSrc(self, work):
        work.addSrc(self.rtl)

    def addTst(self, work):
        work.addSrc(self.tst)

    def add(self, work):
        self.addSrc(work)
        self.addTst(work)

if __name__ == "__main__":

    # Init ALU
    tstCu = tstControlUnit()

    # Logica Combinacional RTL
    tstLogiComb = tstLogiComb()
    tstLogiComb.addSrc(tstCu.work)

    # ULA
    tstUla = tstUla()
    tstUla.addSrc(tstCu.work)

    # Logica Sequencial
    tstSeq = tstLogiSeq()
    tstSeq.addSrc(tstCu.work)

    # Logica Sequencial
    tstCu.add(tstCu.work)
    tstCu.work.run()



