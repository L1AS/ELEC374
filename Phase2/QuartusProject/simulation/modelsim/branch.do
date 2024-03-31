onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /branch_tb/clock
add wave -noupdate -radix hexadecimal /branch_tb/Present_state
add wave -noupdate -radix binary /branch_tb/opcode
add wave -noupdate -radix hexadecimal /branch_tb/CPU/IR/q
add wave -noupdate /branch_tb/IRin
add wave -noupdate -radix hexadecimal /branch_tb/CPU/PC/q
add wave -noupdate /branch_tb/PC_en
add wave -noupdate /branch_tb/IncPC
add wave -noupdate /branch_tb/PCout_en
add wave -noupdate -radix hexadecimal /branch_tb/CPU/MDR/q
add wave -noupdate /branch_tb/MDRin
add wave -noupdate /branch_tb/MDRout
add wave -noupdate -radix hexadecimal /branch_tb/CPU/MAR/q
add wave -noupdate /branch_tb/MARin
add wave -noupdate /branch_tb/memRead
add wave -noupdate /branch_tb/CPU/DUT/Zlow/q
add wave -noupdate /branch_tb/Zin
add wave -noupdate /branch_tb/Zlowout
add wave -noupdate -radix hexadecimal /branch_tb/CPU/busMuxOut
add wave -noupdate /branch_tb/Gra
add wave -noupdate /branch_tb/Rin
add wave -noupdate /branch_tb/Rout
add wave -noupdate /branch_tb/BAout
add wave -noupdate /branch_tb/Yin
add wave -noupdate /branch_tb/Cout
add wave -noupdate /branch_tb/CONFF_out
add wave -noupdate /branch_tb/CONin
add wave -noupdate -radix hexadecimal /branch_tb/CPU/DUT/In_Port/q
add wave -noupdate /branch_tb/inPort_en
add wave -noupdate -radix hexadecimal /branch_tb/inPortDataIn
add wave -noupdate /branch_tb/inPortOut
add wave -noupdate -radix hexadecimal /branch_tb/CPU/DUT/R5/q
add wave -noupdate /branch_tb/CPU/DUT/R5/enable
add wave -noupdate -radix hexadecimal /branch_tb/CPU/DUT/alu_out
add wave -noupdate /branch_tb/CPU/branch_condition/w1
add wave -noupdate /branch_tb/CPU/branch_condition/w2
add wave -noupdate /branch_tb/CPU/branch_condition/w3
add wave -noupdate /branch_tb/CPU/branch_condition/w4
add wave -noupdate /branch_tb/CPU/branch_condition/con_data
add wave -noupdate /branch_tb/CPU/branch_condition/CON/Q
add wave -noupdate /branch_tb/CPU/branch_condition/CON/Q_not
add wave -noupdate /branch_tb/CPU/branch_condition/CON/D
add wave -noupdate /branch_tb/CPU/branch_condition/CON/clk
add wave -noupdate /branch_tb/CPU/branch_condition/CON/q_internal
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {148443 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
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
WaveRestoreZoom {0 ps} {585244 ps}
