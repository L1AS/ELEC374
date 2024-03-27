onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /general_tb/CPU/clock
add wave -noupdate -radix hexadecimal /general_tb/Present_state
add wave -noupdate -radix hexadecimal /general_tb/CPU/PC/q
add wave -noupdate /general_tb/PCout_en
add wave -noupdate /general_tb/IncPC
add wave -noupdate /general_tb/PC_en
add wave -noupdate /general_tb/CPU/IR/q
add wave -noupdate /general_tb/IRin
add wave -noupdate /general_tb/Zlowout
add wave -noupdate /general_tb/MDRout
add wave -noupdate /general_tb/MDRin
add wave -noupdate /general_tb/MARin
add wave -noupdate /general_tb/Zin
add wave -noupdate /general_tb/CPU/DUT/busMuxOut
add wave -noupdate -radix hexadecimal /general_tb/CPU/Mdatain
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {281481 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 253
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
WaveRestoreZoom {0 ps} {294 ns}
