import os, sys, argparse, file_utils

PATH_APP       = os.path.dirname(os.path.abspath(__file__))
TEMP_PATH      = PATH_APP + "/temp"

class AssemblerTask:
    def __init__(self, assembler, temp_path=TEMP_PATH, verbose=False):
        self.verbose    = verbose
        self.assembler  = assembler
        self.temp_path  = temp_path

    def setup(self, stream_in, stream_out):
        self.file_in  = file_utils.stream_to_file(file_in, temp_path +  "/rom_in.asm")
        self.file_out = temp_path + "/rom_out.bin"
        self.stream_out = stream_out
        self.running = False
        self.end     = False

    def run(self):
        print("Teste!")
        self.running = True
        if self.verbose:
            print("Starting assembler....")
        os.system(f"{ASSEMBLER_EXEC} -i {self.rom_in} -o {self.rom_out}")
        self.stream_out = file_utils.file_to_stream(self.file_out, self.stream_out)
        if self.verbose:
            print("Ending assembler....")
        self.end = True
        self.running = False

    def reset(self):
        self.end = False
        self.running = False

if __name__ == "__main__":
    asm = AssemblerTask("java -jar Z01-Assembler.jar", True)
    parser = argparse.ArgumentParser(description="Assemble Z01 CPU ASM file to binary OP Codes.")
    parser.add_argument('file_in')
    parser.add_argument('file_out')
    args = parser.parse_args()
    asm.setup(open(args.file_in, "r"), open(args.file_out, "w"))
    asm.run()

