# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas
#
# Run maven jar package from other dir
import os,sys

def genJAR():
    pwd = os.path.abspath(os.path.dirname(__file__))
    pwd = os.path.join(pwd, '..', 'Assembler')
    #pwdr = os.path.dirname(__file__)
    #os.chdir(os.path.join(pwd, "..", "Assembler"))
    os.system("mvn -f {} package -q -e".format(pwd))
    
    #os.chdir(os.path.abspath(pwdr)+'/')

if __name__ == "__main__":
    genJAR()
