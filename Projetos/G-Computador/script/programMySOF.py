# Rafael Corsi @ insper.edu.br
# /2018
# Disciplina Elementos de Sistemas
#
# Abril/2018

import os
import time
import sys

PATH_TOOLS_SCRIPT = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', 'tools', 'scripts')
sys.path.insert(0,PATH_TOOLS_SCRIPT)
from writeSOF import writeSOF

PATH_CDF = os.path.join('..', 'Quartus', 'DE0_CV_Default.cdf')

def programSOF():

    # primeiro reinicia o driver do jtagd
    # no linux
    if(os.name == 'posix'):
        os.system("killall jtagd")
        time.sleep(1)
        os.system("jtagconfig")

    writeSOF(os.path.abspath(PATH_CDF))

if __name__ == "__main__":
    programSOF()
