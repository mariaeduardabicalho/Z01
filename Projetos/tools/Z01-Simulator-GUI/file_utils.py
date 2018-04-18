# -*- coding: utf-8 -*-
# Eduardo Marossi & Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas

import os, shutil, codecs

def stream_to_file(fsrc, filename):
   fsrc.seek(0, 0)
   fdest = open(filename, "w", newline="\n")
   for i, l in enumerate(fsrc):
      fdest.write(l)
   fsrc.seek(0, 0)
   return filename

def file_to_stream(filename, fdest):
   fdest.seek(0, 0)
   fsrc = open(filename, "r")
   shutil.copyfileobj(fsrc, fdest)
   fsrc.close()
   return fdest

def create_empty_rom(file_dest, size=1024):
   dest = open(file_dest, "w")
   for i in range(0, size):
        dest.write("0000000000000000\n")
   dest.close()
   return file_dest
