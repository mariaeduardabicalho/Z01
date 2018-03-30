#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Curso de Elementos de Sistemas
# Desenvolvido por: Rafael Corsi <rafael.corsi@insper.edu.br>
#
# Data de criação: 11/2017
#
# Resumo: executa simulação da CPU via modelsim

import os
import shutil
import argparse
import fileinput
import timeit

from log import logError, logSim


# Path to vsim  #
PATH_VSIM = os.environ.get('VUNIT_MODELSIM_PATH') + "/"

# Files used on this simulation
PATH_WORK       = os.path.dirname(os.path.abspath(__file__))+"/../Z01-Simulator-rtl/"
PATH_DO         = os.path.join(PATH_WORK, "do/sim.do")
TEMP_IN_RAM_MIF = os.path.join(PATH_WORK, "in/tmpRAM.mif")
TEMP_IN_ROM_MIF = os.path.join(PATH_WORK, "in/tmpROM.mif")
OUT_RAM_MEM     = os.path.join(PATH_WORK, "out/RAM.mem")
OUT_ROM_MEM     = os.path.join(PATH_WORK, "out/ROM.mem")
OUT_SIM_LST     = os.path.join(PATH_WORK, "out/SIM.lst")

END = "\n"


def setRuntimeDo(time, doFile):
        for line in fileinput.input(doFile, inplace = 1):
            if "run" in line:
                print("run "+str(time)+" ns")
            else:
                print(line.rstrip())


def rmFile(f):
    try:
        os.remove(f)
    except OSError:
        pass


def simulateCPU(ramIn, romIn, ramOut, time, debug, verbose):


    ramIn = os.path.abspath(ramIn)
    romIn = os.path.abspath(romIn)
    ramOut = os.path.abspath(ramOut)

    print(TEMP_IN_RAM_MIF)

    try:
            shutil.rmtree(OUT_RAM_MEM)
            shutil.rmtree(OUT_ROM_MEM)
            shutil.rmtree(OUT_SIM_LST)
    except:
            pass

    try:
        shutil.copyfile(ramIn, TEMP_IN_RAM_MIF)
        shutil.copyfile(romIn, TEMP_IN_ROM_MIF)
    except:
        logError("Arquivos não encontrados :")
        logError("    - {}".format(romIn))
        logError("    - {}".format(ramIn))

    if PATH_VSIM is None:
            logError("Configurar a variavel de ambiente : 'VUNIT_MODELSIM_PATH' ")
            return(0)

    setRuntimeDo(time, PATH_DO)

    v = ""
    if verbose is False:
            v = " &> /dev/null "

    c = ""
    if debug is False:
            c = " -c "

    # executa simulacao no modelsim
    owd = os.getcwd()
    os.chdir(PATH_WORK)
    os.system(PATH_VSIM + "vsim" + c + " -do " + PATH_DO + v)
    os.chdir(owd)

    #logSim(" + Simulacao Concluida")
    shutil.copyfile(OUT_RAM_MEM, ramOut)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-R", "--in_ram_mif", required=True, help="estado inicial da RAM no formato .mif ")
    ap.add_argument("-P", "--in_rom_mif", required=True, help="estado inicial da ROM no formato .mif ")
    ap.add_argument("-O", "--out_ram", required=True, help="diretorio para saída das simulacoes")
    ap.add_argument("-T", "--time_ns", required=True, help="Tempo em ns da simulacao")
    ap.add_argument("-d", "--debug", required=False,  action='store_true', help="open modelsim window")
    ap.add_argument("-v", "--verbose", required=False,  action='store_true', help="shows modelsim output")
    args = vars(ap.parse_args())

    if args["debug"]:
            debug = True
    else:
            debug = False

    if args["verbose"]:
            verbose = True
    else:
            verbose = False

    simulateCPU(ramIn=args["in_ram_mif"],
                romIn=args["in_rom_mif"],
                ramOut=args["out_ram"],
                time=args["time_ns"],
                debug=debug,
                verbose=verbose)
