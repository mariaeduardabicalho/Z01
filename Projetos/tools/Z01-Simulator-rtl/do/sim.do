################################
# Desabilita alguns warnings
################################

set StdArithNoWarnings 1
set StdNumNoWarnings 1
set NumericStdNoWarnings 1

################################
# Recompila memória (para adicionar estado inicial a elas)
################################
# RAM16K
vcom -work z01 ./Modulos/dispositivos/RAM_fpga/RAM16K.vhd

# ROM
vcom -work z01 ./Modulos/dispositivos/ROM/ROM32K.vhd


#################################
# Carrega simulação no computador_tb
#################################
# carrega modulo

vsim z01.computador_tb

# carrega lista de sinais a serem exportados

do list.do

################################
# carrega wave com a CPU
################################
add wave -position end sim:/computador_tb/c1/MAIN_CPU/*

################################
# Executa simulação
################################

run 1010 ns

################################
# Exporta resultado (list)
################################

write list ./out/SIM.lst

################################
# Exporta memorias
################################
# ROM
mem save -o ./out/ROM.mem -f mti -data binary -addr decimal -startaddress 0 -endaddress 32767 -wordsperline 1 /computador_tb/c1/ROM/altsyncram_component/MEMORY/m_mem_data_a

# RAM
mem save -o ./out/RAM.mem -f mti -data binary -addr decimal -startaddress 0 -endaddress 32767 -wordsperline 1 /computador_tb/c1/RAM/altsyncram_component/MEMORY/m_mem_data_a

################################
# Exit
################################

exit







