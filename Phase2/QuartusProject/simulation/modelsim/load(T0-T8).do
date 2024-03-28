onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /load_tb/CPU/clock
add wave -noupdate -radix hexadecimal /load_tb/Present_state
add wave -noupdate /load_tb/opcode
add wave -noupdate -radix binary /load_tb/CPU/IR/q
add wave -noupdate /load_tb/IRin
add wave -noupdate -radix hexadecimal /load_tb/CPU/PC/q
add wave -noupdate /load_tb/PC_en
add wave -noupdate /load_tb/IncPC
add wave -noupdate /load_tb/PCout_en
add wave -noupdate -radix hexadecimal /load_tb/CPU/MDR/q
add wave -noupdate /load_tb/MDRin
add wave -noupdate /load_tb/MDRout
add wave -noupdate -radix hexadecimal /load_tb/CPU/MAR/q
add wave -noupdate /load_tb/MARin
add wave -noupdate /load_tb/memRead
add wave -noupdate -radix hexadecimal /load_tb/CPU/DUT/Zlow/q
add wave -noupdate /load_tb/Zin
add wave -noupdate /load_tb/Zlowout
add wave -noupdate -radix hexadecimal /load_tb/CPU/MDRMux/busMuxOut
add wave -noupdate /load_tb/CPU/DUT/busMux/busMuxSignal
add wave -noupdate -radix hexadecimal /load_tb/CPU/MDRMux/Mdatain
add wave -noupdate /load_tb/Gra
add wave -noupdate /load_tb/Grb
add wave -noupdate /load_tb/Grc
add wave -noupdate /load_tb/Rin
add wave -noupdate /load_tb/Rout
add wave -noupdate /load_tb/BAout
add wave -noupdate -radix hexadecimal /load_tb/CPU/DUT/RY/q
add wave -noupdate /load_tb/Yin
add wave -noupdate -radix hexadecimal /load_tb/CPU/DUT/busMux/cSignExtended
add wave -noupdate /load_tb/Cout
add wave -noupdate -radix hexadecimal /load_tb/CPU/DUT/R0/q
add wave -noupdate /load_tb/CPU/DUT/R0/enable
add wave -noupdate -radix hexadecimal /load_tb/CPU/DUT/R2/q
add wave -noupdate /load_tb/CPU/DUT/R2/enable
add wave -noupdate -radix hexadecimal /load_tb/CPU/DUT/ALU/alu_out
add wave -noupdate -radix hexadecimal {/load_tb/CPU/RAM/altsyncram_component/m_default/altsyncram_inst/mem_data[149]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {41403 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 472
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {206666 ps}
