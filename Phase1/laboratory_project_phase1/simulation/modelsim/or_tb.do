onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /or_tb/clock
add wave -noupdate -radix unsigned /or_tb/Present_state
add wave -noupdate /or_tb/operation
add wave -noupdate /or_tb/PCout
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInPC
add wave -noupdate /or_tb/PCin
add wave -noupdate /or_tb/IncPC
add wave -noupdate /or_tb/DUT/IRout
add wave -noupdate -radix binary /or_tb/IRin
add wave -noupdate -radix hexadecimal /or_tb/Mdatain
add wave -noupdate /or_tb/MARin
add wave -noupdate /or_tb/Read
add wave -noupdate /or_tb/MDRout
add wave -noupdate -radix hexadecimal /or_tb/DUT/MDRMuxOut
add wave -noupdate /or_tb/MDRin
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /or_tb/DUT/Yout
add wave -noupdate /or_tb/Yin
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR1
add wave -noupdate /or_tb/R1in
add wave -noupdate /or_tb/R2out
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR2
add wave -noupdate /or_tb/R2in
add wave -noupdate /or_tb/R3out
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR3
add wave -noupdate /or_tb/R3in
add wave -noupdate /or_tb/Zlowout
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInZlow
add wave -noupdate /or_tb/Zin
add wave -noupdate -radix hexadecimal /or_tb/DUT/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6338 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
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
configure wave -timelineunits ns
update
WaveRestoreZoom {139349 ps} {266351 ps}
