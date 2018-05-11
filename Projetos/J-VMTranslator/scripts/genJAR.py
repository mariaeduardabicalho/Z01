# Rafael Corsi @ insper.edu.br
# Dez/2017
# Disciplina Elementos de Sistemas
#
# Run maven jar package from other dir
import os,sys

# Verificar se testes unitários passaram
def checkUnitTests(dirname):

        hasErrors = False

        # rotina de leitura do arquivo de teste
        for filename in os.listdir(dirname):
            if filename.endswith('.txt'):
                try:
                    with open(dirname+filename, 'r') as f:
                            tmp = f.read().splitlines()
                            partes = tmp[3].split()
                            for i in range(len(partes)):
                                    if(partes[i]=='Failures:'):
                                            if(partes[i+1]!='0,'):
                                                    hasErrors = True
                                    if(partes[i]=='Errors:'):
                                            if(partes[i+1]!='0,'):
                                                    hasErrors = True
                                    if(partes[i]=='Skipped:'):
                                            if(partes[i+1]!='0,'):
                                                    hasErrors = True
                    return hasErrors
                except IOError:
                    print('Error : Arquivo não encontrado: {}'.format(filename))
                    return(1)


def genJAR():
    pwd = os.path.abspath(os.path.dirname(__file__))
    pwd = os.path.join(pwd, '..', 'VMtranslator')
    os.system("mvn -f {} package -q -e".format(pwd))
    error = checkUnitTests(os.path.join(pwd,'target', 'surefire-reports'+'/'))
    if(error):
            print("Erro nos testes unitários")
            return(1)

if __name__ == "__main__":
    genJAR()
