onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sub_tb/clock
add wave -noupdate -radix unsigned /sub_tb/Present_state
add wave -noupdate /sub_tb/operation
add wave -noupdate /sub_tb/PCout
add wave -noupdate -radix hexadecimal /sub_tb/DUT/BusMuxInPC
add wave -noupdate /sub_tb/PCin
add wave -noupdate /sub_tb/IncPC
add wave -noupdate -radix hexadecimal /sub_tb/DUT/IRout
add wave -noupdate /sub_tb/IRin
add wave -noupdate -radix hexadecimal /sub_tb/Mdatain
add wave -noupdate /sub_tb/MARin
add wave -noupdate /sub_tb/Read
add wave -noupdate /sub_tb/MDRout
add wave -noupdate -radix hexadecimal /sub_tb/DUT/MDRMuxOut
add wave -noupdate /sub_tb/MDRin
add wave -noupdate -radix hexadecimal /sub_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /sub_tb/DUT/Yout
add wave -noupdate /sub_tb/Yin
add wave -noupdate -radix hexadecimal /sub_tb/DUT/BusMuxInR1
add wave -noupdate /sub_tb/R1in
add wave -noupdate /sub_tb/R2out
add wave -noupdate -radix hexadecimal /sub_tb/DUT/BusMuxInR2
add wave -noupdate /sub_tb/R2in
add wave -noupdate /sub_tb/R3out
add wave -noupdate -radix hexadecimal /sub_tb/DUT/BusMuxInR3
add wave -noupdate /sub_tb/R3in
add wave -noupdate /sub_tb/Zlowout
add wave -noupdate -radix hexadecimal /sub_tb/DUT/BusMuxInZlow
add wave -noupdate /sub_tb/Zin
add wave -noupdate -radix hexadecimal /sub_tb/DUT/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 187
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
WaveRestoreZoom {0 ps} {260 ns}
