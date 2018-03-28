import os, sys, argparse, file_utils, subprocess
from PyQt5.QtCore import QThread, QObject, pyqtSignal, pyqtSlot

PATH_APP       = os.path.dirname(os.path.abspath(__file__))
TEMP_PATH      = PATH_APP + "/temp"

class AssemblerTask(QObject):
    finished = pyqtSignal()
    
    def __init__(self, assembler, temp_path, verbose=False):
        super().__init__()
        self.verbose    = verbose
        self.assembler  = assembler
        self.temp_path  = temp_path
        self.success    = False
        self.labels_pos = []

    def setup(self, stream_in, stream_out):
        self.stream_in = stream_in
        self.file_in  = file_utils.stream_to_file(stream_in, self.temp_path + "/rom_in.nasm")
        self.file_out = self.temp_path + "/rom_out.hack"
        self.stream_out = stream_out
        self.running = False
        self.end     = False
 
    @pyqtSlot()
    def run(self):
        self.running = True
        if self.verbose:
            print("Starting assembler....")
        retval = subprocess.call(f"{self.assembler} -i {self.file_in} -o {self.file_out}", shell=True)
        if retval == 0:
            self.success = True
        self.stream_out = file_utils.file_to_stream(self.file_out, self.stream_out)
        if self.verbose:
            print("Ending assembler....")
        self.labels_pos = self.get_labels_positions(self.stream_in)
        self.end = True
        self.running = False
        self.finished.emit()

    def reset(self):
        self.end = False
        self.running = False

    def get_labels_positions(self, stream_in):
        labels_pos = []
        stream_in.seek(0, 0)
        for i, l in enumerate(stream_in):
            if l.strip().endswith(":"):
                labels_pos.append(i)
        return labels_pos

if __name__ == "__main__":
    asm = AssemblerTask("java -jar Z01-Assembler.jar", TEMP_PATH, True)
    parser = argparse.ArgumentParser(description="Assemble Z01 CPU ASM file to binary OP Codes.")
    parser.add_argument('file_in')
    parser.add_argument('file_out')
    args  = parser.parse_args()
    asm.setup(open(args.file_in, "r"), open(args.file_out, "w"))
    asm.run()

