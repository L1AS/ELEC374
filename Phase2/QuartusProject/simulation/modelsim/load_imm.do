onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /load_imm_tb/clock
add wave -noupdate -radix hexadecimal /load_imm_tb/Present_state
add wave -noupdate /load_imm_tb/opcode
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/IRout
add wave -noupdate /load_imm_tb/IRin
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/PC/q
add wave -noupdate /load_imm_tb/PC_en
add wave -noupdate /load_imm_tb/IncPC
add wave -noupdate /load_imm_tb/PCout_en
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/MDR/q
add wave -noupdate /load_imm_tb/MDRin
add wave -noupdate /load_imm_tb/MDRout
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/MAR/q
add wave -noupdate /load_imm_tb/MARin
add wave -noupdate /load_imm_tb/memRead
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/DUT/Zlow/q
add wave -noupdate /load_imm_tb/Zin
add wave -noupdate /load_imm_tb/Zlowout
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/busMuxOut
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/Mdatain
add wave -noupdate /load_imm_tb/Gra
add wave -noupdate /load_imm_tb/Grb
add wave -noupdate /load_imm_tb/Grc
add wave -noupdate /load_imm_tb/Rin
add wave -noupdate /load_imm_tb/Rout
add wave -noupdate /load_imm_tb/BAout
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/DUT/RY/q
add wave -noupdate /load_imm_tb/Yin
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/cSignExtended
add wave -noupdate /load_imm_tb/Cout
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/DUT/R0/q
add wave -noupdate -radix binary /load_imm_tb/CPU/DUT/R0/enable
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/DUT/R2/q
add wave -noupdate -radix binary /load_imm_tb/CPU/DUT/R2/enable
add wave -noupdate -radix hexadecimal /load_imm_tb/CPU/DUT/ALU/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {180718 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {200 ns}
