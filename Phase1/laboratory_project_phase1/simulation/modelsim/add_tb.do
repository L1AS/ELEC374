onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /add_tb/clock
add wave -noupdate -radix unsigned /add_tb/Present_state
add wave -noupdate /add_tb/operation
add wave -noupdate /add_tb/PCout
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInPC
add wave -noupdate /add_tb/PCin
add wave -noupdate /add_tb/IncPC
add wave -noupdate -radix hexadecimal /add_tb/DUT/IRout
add wave -noupdate /add_tb/IRin
add wave -noupdate -radix hexadecimal /add_tb/Mdatain
add wave -noupdate /add_tb/MARin
add wave -noupdate /add_tb/Read
add wave -noupdate /add_tb/MDRout
add wave -noupdate -radix hexadecimal /add_tb/DUT/MDRMuxOut
add wave -noupdate /add_tb/MDRin
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /add_tb/DUT/Yout
add wave -noupdate /add_tb/Yin
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR1
add wave -noupdate /add_tb/R1in
add wave -noupdate /add_tb/R2out
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR2
add wave -noupdate /add_tb/R3out
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR3
add wave -noupdate /add_tb/Zlowout
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInZlow
add wave -noupdate /add_tb/Zin
add wave -noupdate -radix hexadecimal /add_tb/DUT/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {268709 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
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
