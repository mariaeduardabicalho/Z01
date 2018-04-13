# Rafael Corsi @ insper.edu.br
# /2018
# Disciplina Elementos de Sistemas
#
# Abril/2018

import os
import time

PATH_TOOLS_SCRIPT = os.path.dirname(os.path.abspath(__file__))+"/../../tools/scripts/"

def programSOF():

    # primeiro reinicia o driver do jtagd
    # no linux
    if(os.name == 'posix'):
        os.system("killall jtagd")
        time.sleep(1)
        os.system("jtagconfig")

    owd = os.getcwd()
    os.chdir(PATH_TOOLS_SCRIPT)
    os.system("./gravaFPGAcyclone5.sh")
    os.chdir(owd)

if __name__ == "__main__":
    programSOF()
