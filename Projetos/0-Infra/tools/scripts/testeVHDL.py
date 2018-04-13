#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Adaptado de :     Pedro Cunial   <pedrocc4@al.insper.edu.br>
#                   Luciano Soares <lpsoares@insper.edu.br>
# Data de criação: 07/2017

import os

# vnuit para vhdl
from vunit import VUnitCLI, VUnit


class vhdlScript(object):

    def __init__(self):
        # config
        self.cli = VUnitCLI()
        self.args = self.cli.parse_args()
        self.args.gtkwave_fmt = 'vcd'
        self.args.num_threads = 4
        self.ui = VUnit.from_args(self.args)
        self.lib = self.ui.add_library("lib")

    def add_src_lib(self, path):
        for filename in os.listdir(path):
            if(filename.split(".")[-1]=="vhd"):
                self.lib.add_source_files(path+filename)

    def useLib(self, lib):
        self.lib = lib

    def addSrc(self, pwd):
        self.add_src_lib(pwd)

    def run(self):
        self.ui.main()
