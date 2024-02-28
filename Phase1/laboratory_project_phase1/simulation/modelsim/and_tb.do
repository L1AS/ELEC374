onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /and_tb/clock
add wave -noupdate -radix unsigned /and_tb/Present_state
add wave -noupdate /and_tb/operation
add wave -noupdate /and_tb/PCout
add wave -noupdate -radix hexadecimal /and_tb/DUT/BusMuxInPC
add wave -noupdate /and_tb/PCin
add wave -noupdate /and_tb/IncPC
add wave -noupdate -radix hexadecimal /and_tb/DUT/IRout
add wave -noupdate /and_tb/IRin
add wave -noupdate -radix hexadecimal /and_tb/Mdatain
add wave -noupdate /and_tb/MARin
add wave -noupdate /and_tb/Read
add wave -noupdate /and_tb/MDRout
add wave -noupdate -radix hexadecimal /and_tb/DUT/MDRMuxOut
add wave -noupdate /and_tb/MDRin
add wave -noupdate -radix hexadecimal /and_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /and_tb/DUT/Yout
add wave -noupdate /and_tb/Yin
add wave -noupdate -radix hexadecimal /and_tb/DUT/BusMuxInR1
add wave -noupdate /and_tb/R1in
add wave -noupdate /and_tb/R2out
add wave -noupdate -radix hexadecimal /and_tb/DUT/BusMuxInR2
add wave -noupdate /and_tb/R2in
add wave -noupdate /and_tb/R3out
add wave -noupdate -radix hexadecimal /and_tb/DUT/BusMuxInR3
add wave -noupdate /and_tb/R3in
add wave -noupdate /and_tb/Zlowout
add wave -noupdate -radix hexadecimal /and_tb/DUT/BusMuxInZlow
add wave -noupdate /and_tb/Zin
add wave -noupdate -radix hexadecimal /and_tb/DUT/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {299431 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
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
