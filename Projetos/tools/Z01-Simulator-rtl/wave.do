onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/locked
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/outclk_0
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/outclk_1
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/refclk
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/rst
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/wire_gnd
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/wire_pll_altera_pll_altera_pll_i_1098_locked
add wave -noupdate -expand -group pll /computador_tb/c1/PLL_inst/wire_pll_altera_pll_altera_pll_i_1098_outclk
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/clock
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/reset
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/instruction
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/inM
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/outM
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/writeM
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/addressM
add wave -noupdate -expand -group CPU -radix hexadecimal /computador_tb/c1/MAIN_CPU/pcout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_muxALUI_A
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_muxAM_ALU
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_muxSD_ALU
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_zx
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_nx
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_zy
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_ny
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_f
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_no
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_loadA
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_loadD
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_loadS
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_loadPC
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_zr
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_ng
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_muxALUI_Aout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_muxAM_ALUout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_muxSDout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_regAout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_regDout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_regSout
add wave -noupdate -expand -group CPU /computador_tb/c1/MAIN_CPU/s_ALUout
add wave -noupdate -expand -group RAM /computador_tb/reset_n
add wave -noupdate -expand -group RAM /computador_tb/c1/MEMORY_MAPED/RAM/address
add wave -noupdate -expand -group RAM /computador_tb/c1/MEMORY_MAPED/RAM/clock
add wave -noupdate -expand -group RAM /computador_tb/c1/MEMORY_MAPED/RAM/data
add wave -noupdate -expand -group RAM /computador_tb/c1/MEMORY_MAPED/RAM/wren
add wave -noupdate -expand -group RAM /computador_tb/c1/MEMORY_MAPED/RAM/q
add wave -noupdate -expand -group RAM /computador_tb/c1/MEMORY_MAPED/RAM/sub_wire0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6822414 ps} 0} {{Cursor 2} {1724309 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 1051
configure wave -valuecolwidth 560
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 100
configure wave -gridperiod 200
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3889553 ps}
