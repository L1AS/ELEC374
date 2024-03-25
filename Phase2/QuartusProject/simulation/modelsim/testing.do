onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /general_tb/clock
add wave -noupdate /general_tb/Gra
add wave -noupdate /general_tb/Grb
add wave -noupdate /general_tb/Grc
add wave -noupdate -radix unsigned /general_tb/Present_state
add wave -noupdate /general_tb/CPU/RAM/address
add wave -noupdate -radix hexadecimal /general_tb/CPU/RAM/data
add wave -noupdate /general_tb/CPU/RAM/rden
add wave -noupdate /general_tb/CPU/RAM/wren
add wave -noupdate -radix hexadecimal /general_tb/CPU/RAM/q
add wave -noupdate /general_tb/memWrite
add wave -noupdate /general_tb/memRead
add wave -noupdate -radix hexadecimal /general_tb/CPU/PC/q
add wave -noupdate /general_tb/CPU/IR/q
add wave -noupdate /general_tb/CPU/IR/enable
add wave -noupdate /general_tb/CPU/MAR/enable
add wave -noupdate /general_tb/CPU/MAR/q
add wave -noupdate -radix hexadecimal /general_tb/CPU/MDRMux/out
add wave -noupdate -radix hexadecimal /general_tb/CPU/MDRMux/input1
add wave -noupdate -radix hexadecimal /general_tb/CPU/MDRMux/input2
add wave -noupdate /general_tb/CPU/MDRMux/read
add wave -noupdate /general_tb/CPU/MDR/enable
add wave -noupdate /general_tb/CPU/MDR/q
add wave -noupdate /general_tb/CPU/DUT/R2/q
add wave -noupdate /general_tb/CPU/DUT/R2/q
add wave -noupdate -radix hexadecimal /general_tb/CPU/DUT/busMux/busMuxOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70665 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
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
WaveRestoreZoom {0 ps} {210 ns}
