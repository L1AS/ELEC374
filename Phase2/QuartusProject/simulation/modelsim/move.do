onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /move_tb/clock
add wave -noupdate -radix hexadecimal /move_tb/Present_state
add wave -noupdate -radix hexadecimal /move_tb/CPU/IR/q
add wave -noupdate /move_tb/IRin
add wave -noupdate -radix hexadecimal /move_tb/CPU/PC/q
add wave -noupdate /move_tb/PC_en
add wave -noupdate /move_tb/PCout_en
add wave -noupdate /move_tb/IncPC
add wave -noupdate -radix hexadecimal /move_tb/CPU/DUT/Zlow/q
add wave -noupdate /move_tb/Zlowout
add wave -noupdate /move_tb/Zin
add wave -noupdate -radix hexadecimal /move_tb/CPU/RAM/q
add wave -noupdate -radix hexadecimal /move_tb/CPU/MDR/q
add wave -noupdate /move_tb/MDRin
add wave -noupdate /move_tb/MDRout
add wave -noupdate -radix hexadecimal /move_tb/CPU/MAR/q
add wave -noupdate /move_tb/MARin
add wave -noupdate -radix hexadecimal /move_tb/CPU/busMuxOut
add wave -noupdate -radix hexadecimal /move_tb/CPU/DUT/In_Port/q
add wave -noupdate -radix hexadecimal /move_tb/inPortDataIn
add wave -noupdate /move_tb/inPort_en
add wave -noupdate /move_tb/inPortOut
add wave -noupdate -radix hexadecimal /move_tb/CPU/DUT/HI/q
add wave -noupdate -radix binary /move_tb/CPU/DUT/HI/enable
add wave -noupdate /move_tb/HIout
add wave -noupdate -radix hexadecimal /move_tb/CPU/DUT/LO/q
add wave -noupdate -radix binary /move_tb/CPU/DUT/LO/enable
add wave -noupdate /move_tb/LOout
add wave -noupdate -radix hexadecimal /move_tb/CPU/DUT/R7/q
add wave -noupdate -radix binary /move_tb/CPU/DUT/R7/enable
add wave -noupdate -radix hexadecimal /move_tb/CPU/DUT/R6/q
add wave -noupdate -radix binary /move_tb/CPU/DUT/R6/enable
add wave -noupdate /move_tb/Gra
add wave -noupdate /move_tb/Rin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {56150 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 211
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
WaveRestoreZoom {0 ps} {154088 ps}
