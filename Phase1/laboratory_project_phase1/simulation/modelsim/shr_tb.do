onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shr_tb/clock
add wave -noupdate -radix unsigned /shr_tb/Present_state
add wave -noupdate /shr_tb/operation
add wave -noupdate /shr_tb/PCout
add wave -noupdate -radix hexadecimal /shr_tb/DUT/BusMuxInPC
add wave -noupdate /shr_tb/PCin
add wave -noupdate /shr_tb/IncPC
add wave -noupdate /shr_tb/DUT/IRout
add wave -noupdate /shr_tb/IRin
add wave -noupdate -radix hexadecimal /shr_tb/Mdatain
add wave -noupdate /shr_tb/MARin
add wave -noupdate /shr_tb/Read
add wave -noupdate /shr_tb/MDRout
add wave -noupdate -radix hexadecimal /shr_tb/DUT/MDRMuxOut
add wave -noupdate /shr_tb/MDRin
add wave -noupdate -radix hexadecimal /shr_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /shr_tb/DUT/Yout
add wave -noupdate /shr_tb/Yin
add wave -noupdate -radix hexadecimal /shr_tb/DUT/BusMuxInR1
add wave -noupdate /shr_tb/R1in
add wave -noupdate /shr_tb/R2out
add wave -noupdate -radix hexadecimal /shr_tb/DUT/BusMuxInR2
add wave -noupdate /shr_tb/R2in
add wave -noupdate /shr_tb/R3out
add wave -noupdate -radix hexadecimal /shr_tb/DUT/BusMuxInR3
add wave -noupdate /shr_tb/R3in
add wave -noupdate /shr_tb/Zlowout
add wave -noupdate -radix hexadecimal /shr_tb/DUT/BusMuxInZlow
add wave -noupdate /shr_tb/Zin
add wave -noupdate -radix hexadecimal /shr_tb/DUT/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {254257 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {117333 ps}
