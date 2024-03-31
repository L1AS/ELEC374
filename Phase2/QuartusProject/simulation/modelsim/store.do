onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /store_tb/clock
add wave -noupdate -radix hexadecimal /store_tb/Present_state
add wave -noupdate /store_tb/opcode
add wave -noupdate -radix binary /store_tb/CPU/IR/q
add wave -noupdate /store_tb/IRin
add wave -noupdate -radix hexadecimal /store_tb/CPU/PC/q
add wave -noupdate /store_tb/PC_en
add wave -noupdate /store_tb/PCout_en
add wave -noupdate /store_tb/IncPC
add wave -noupdate -radix hexadecimal /store_tb/CPU/MDR/q
add wave -noupdate /store_tb/MDRin
add wave -noupdate /store_tb/MDRout
add wave -noupdate -radix hexadecimal /store_tb/CPU/MAR/q
add wave -noupdate /store_tb/MARin
add wave -noupdate -radix hexadecimal /store_tb/CPU/RAM/address
add wave -noupdate -radix hexadecimal /store_tb/CPU/RAM/q
add wave -noupdate /store_tb/memRead
add wave -noupdate -radix hexadecimal /store_tb/CPU/RAM/data
add wave -noupdate /store_tb/memWrite
add wave -noupdate /store_tb/Gra
add wave -noupdate /store_tb/Grb
add wave -noupdate /store_tb/Grc
add wave -noupdate /store_tb/Rin
add wave -noupdate /store_tb/Rout
add wave -noupdate /store_tb/BAout
add wave -noupdate /store_tb/Yin
add wave -noupdate -radix hexadecimal /store_tb/CPU/DUT/cSignExtended
add wave -noupdate /store_tb/Cout
add wave -noupdate -radix hexadecimal /store_tb/CPU/DUT/Zlow/q
add wave -noupdate /store_tb/Zin
add wave -noupdate /store_tb/Zlowout
add wave -noupdate -radix hexadecimal /store_tb/CPU/DUT/R1/q
add wave -noupdate /store_tb/CPU/DUT/R1/enable
add wave -noupdate -radix hexadecimal /store_tb/CPU/DUT/ALU/alu_out
add wave -noupdate -radix hexadecimal /store_tb/inPortDataIn
add wave -noupdate /store_tb/inPort_en
add wave -noupdate /store_tb/inPortOut
add wave -noupdate -label {/store_tb/CPU/RAM/.../altsyncram_inst/mem_data[135]} -radix hexadecimal {/store_tb/CPU/RAM/altsyncram_component/m_default/altsyncram_inst/mem_data[135]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {220241 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 318
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {380 ns}
