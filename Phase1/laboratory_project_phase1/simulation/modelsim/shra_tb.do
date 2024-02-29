onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shra_tb/clock
add wave -noupdate -radix unsigned /shra_tb/Present_state
add wave -noupdate /shra_tb/operation
add wave -noupdate /shra_tb/PCout
add wave -noupdate -radix hexadecimal /shra_tb/DUT/BusMuxInPC
add wave -noupdate /shra_tb/PCin
add wave -noupdate /shra_tb/IncPC
add wave -noupdate -radix binary /shra_tb/DUT/IRout
add wave -noupdate /shra_tb/IRin
add wave -noupdate -radix hexadecimal /shra_tb/Mdatain
add wave -noupdate /shra_tb/MARin
add wave -noupdate /shra_tb/Read
add wave -noupdate /shra_tb/MDRout
add wave -noupdate -radix hexadecimal /shra_tb/DUT/MDRMuxOut
add wave -noupdate /shra_tb/MDRin
add wave -noupdate -radix hexadecimal /shra_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /shra_tb/DUT/Yout
add wave -noupdate /shra_tb/Yin
add wave -noupdate -radix hexadecimal /shra_tb/DUT/BusMuxInR1
add wave -noupdate /shra_tb/R1in
add wave -noupdate /shra_tb/R2out
add wave -noupdate -radix hexadecimal /shra_tb/DUT/BusMuxInR2
add wave -noupdate /shra_tb/R2in
add wave -noupdate /shra_tb/R3out
add wave -noupdate -radix hexadecimal /shra_tb/DUT/BusMuxInR3
add wave -noupdate /shra_tb/R3in
add wave -noupdate /shra_tb/Zlowout
add wave -noupdate -radix hexadecimal /shra_tb/DUT/BusMuxInZlow
add wave -noupdate /shra_tb/Zin
add wave -noupdate -radix hexadecimal /shra_tb/DUT/alu_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {253866 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
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
WaveRestoreZoom {0 ps} {273 ns}
