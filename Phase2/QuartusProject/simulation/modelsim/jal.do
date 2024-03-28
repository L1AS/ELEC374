onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /jal_tb/Present_state
add wave -noupdate /jal_tb/clock
add wave -noupdate /jal_tb/opcode
add wave -noupdate -radix binary /jal_tb/CPU/IRout
add wave -noupdate /jal_tb/IRin
add wave -noupdate -radix hexadecimal /jal_tb/CPU/PC/q
add wave -noupdate /jal_tb/PC_en
add wave -noupdate /jal_tb/PCout_en
add wave -noupdate /jal_tb/IncPC
add wave -noupdate -radix hexadecimal /jal_tb/CPU/MDR/q
add wave -noupdate /jal_tb/MDRin
add wave -noupdate /jal_tb/MDRout
add wave -noupdate -radix hexadecimal /jal_tb/CPU/MAR/q
add wave -noupdate /jal_tb/MARin
add wave -noupdate /jal_tb/memRead
add wave -noupdate -radix hexadecimal /jal_tb/CPU/DUT/Zlow/q
add wave -noupdate /jal_tb/Zin
add wave -noupdate /jal_tb/Zlowout
add wave -noupdate -radix hexadecimal /jal_tb/CPU/busMuxOut
add wave -noupdate /jal_tb/CPU/DUT/busMux/busMuxSignal
add wave -noupdate -radix hexadecimal /jal_tb/CPU/Mdatain
add wave -noupdate /jal_tb/Gra
add wave -noupdate /jal_tb/Rin
add wave -noupdate /jal_tb/Rout
add wave -noupdate /jal_tb/inPort_en
add wave -noupdate /jal_tb/inPortOut
add wave -noupdate /jal_tb/CPU/DUT/R6/enable
add wave -noupdate -radix hexadecimal /jal_tb/CPU/DUT/R6/q
add wave -noupdate /jal_tb/CPU/DUT/R15/enable
add wave -noupdate -radix hexadecimal /jal_tb/CPU/DUT/R15/q
add wave -noupdate /jal_tb/jal_R15
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {83607 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 252
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
WaveRestoreZoom {0 ps} {210 ns}
