onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ALU_imm_tb/clock
add wave -noupdate -radix unsigned /ALU_imm_tb/Present_state
add wave -noupdate /ALU_imm_tb/opcode
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/IR/q
add wave -noupdate /ALU_imm_tb/IRin
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/PC/q
add wave -noupdate /ALU_imm_tb/PC_en
add wave -noupdate /ALU_imm_tb/IncPC
add wave -noupdate /ALU_imm_tb/PCout_en
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/MDR/q
add wave -noupdate /ALU_imm_tb/MDRin
add wave -noupdate /ALU_imm_tb/MDRout
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/MAR/q
add wave -noupdate /ALU_imm_tb/MARin
add wave -noupdate /ALU_imm_tb/memRead
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/DUT/Zlow/q
add wave -noupdate /ALU_imm_tb/Zin
add wave -noupdate /ALU_imm_tb/Zlowout
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/MDRMux/busMuxOut
add wave -noupdate /ALU_imm_tb/CPU/DUT/busMux/busMuxSignal
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/MDRMux/Mdatain
add wave -noupdate /ALU_imm_tb/Gra
add wave -noupdate /ALU_imm_tb/Grb
add wave -noupdate /ALU_imm_tb/Grc
add wave -noupdate /ALU_imm_tb/Rin
add wave -noupdate /ALU_imm_tb/Rout
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/DUT/RY/q
add wave -noupdate /ALU_imm_tb/Yin
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/DUT/busMux/cSignExtended
add wave -noupdate /ALU_imm_tb/Cout
add wave -noupdate -radix hexadecimal /ALU_imm_tb/inPortDataIn
add wave -noupdate /ALU_imm_tb/inPort_en
add wave -noupdate /ALU_imm_tb/inPortOut
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/DUT/R3/q
add wave -noupdate /ALU_imm_tb/CPU/DUT/R3/enable
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/DUT/R4/q
add wave -noupdate /ALU_imm_tb/CPU/DUT/R4/enable
add wave -noupdate -radix hexadecimal /ALU_imm_tb/CPU/DUT/ALU/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {165445 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 274
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {210 ns}
