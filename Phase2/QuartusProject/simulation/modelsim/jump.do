onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /jump_tb/Present_state
add wave -noupdate /jump_tb/clock
add wave -noupdate /jump_tb/opcode
add wave -noupdate -radix binary /jump_tb/CPU/IRout
add wave -noupdate /jump_tb/IRin
add wave -noupdate -radix hexadecimal /jump_tb/CPU/PC/q
add wave -noupdate /jump_tb/PC_en
add wave -noupdate /jump_tb/PCout_en
add wave -noupdate /jump_tb/IncPC
add wave -noupdate -radix hexadecimal /jump_tb/CPU/MDR/q
add wave -noupdate /jump_tb/MDRin
add wave -noupdate /jump_tb/MDRout
add wave -noupdate -radix hexadecimal /jump_tb/CPU/MAR/q
add wave -noupdate /jump_tb/MARin
add wave -noupdate /jump_tb/memRead
add wave -noupdate -radix hexadecimal /jump_tb/CPU/DUT/Zlow/q
add wave -noupdate /jump_tb/Zin
add wave -noupdate /jump_tb/Zlowout
add wave -noupdate -radix hexadecimal /jump_tb/CPU/busMuxOut
add wave -noupdate -radix binary /jump_tb/CPU/DUT/busMux/busMuxSignal
add wave -noupdate -radix hexadecimal /jump_tb/CPU/Mdatain
add wave -noupdate /jump_tb/Gra
add wave -noupdate /jump_tb/Rin
add wave -noupdate /jump_tb/Rout
add wave -noupdate /jump_tb/Yin
add wave -noupdate /jump_tb/Cout
add wave -noupdate -radix hexadecimal /jump_tb/inPortDataIn
add wave -noupdate /jump_tb/inPort_en
add wave -noupdate /jump_tb/inPortOut
add wave -noupdate /jump_tb/CPU/DUT/R6/enable
add wave -noupdate -radix hexadecimal /jump_tb/CPU/DUT/R6/q
add wave -noupdate -radix hexadecimal /jump_tb/CPU/DUT/R15/enable
add wave -noupdate -radix hexadecimal /jump_tb/CPU/DUT/R15/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {255000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 252
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {170 ns}
