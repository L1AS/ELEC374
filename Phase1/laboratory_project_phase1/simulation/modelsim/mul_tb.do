onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mul_tb/Mdatain
add wave -noupdate /mul_tb/operation
add wave -noupdate -radix unsigned /mul_tb/Present_state
add wave -noupdate /mul_tb/clock
add wave -noupdate -radix unsigned /mul_tb/Present_state
add wave -noupdate /mul_tb/operation
add wave -noupdate /mul_tb/PCout
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInPC
add wave -noupdate /mul_tb/PCin
add wave -noupdate /mul_tb/IncPC
add wave -noupdate -radix hexadecimal /mul_tb/DUT/IRout
add wave -noupdate /mul_tb/IRin
add wave -noupdate -radix hexadecimal /mul_tb/Mdatain
add wave -noupdate /mul_tb/MARin
add wave -noupdate /mul_tb/Read
add wave -noupdate /mul_tb/MDRout
add wave -noupdate -radix hexadecimal /mul_tb/DUT/MDRMuxOut
add wave -noupdate /mul_tb/MDRin
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /mul_tb/DUT/Yout
add wave -noupdate /mul_tb/Yin
add wave -noupdate /mul_tb/R4out
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInR4
add wave -noupdate /mul_tb/R4in
add wave -noupdate /mul_tb/R5out
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInR5
add wave -noupdate /mul_tb/R5in
add wave -noupdate /mul_tb/Zlowout
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInZlow
add wave -noupdate /mul_tb/Zhighout
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInZhigh
add wave -noupdate /mul_tb/Zin
add wave -noupdate -radix hexadecimal /mul_tb/DUT/alu_out
add wave -noupdate /mul_tb/HIout
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInHI
add wave -noupdate /mul_tb/HIin
add wave -noupdate /mul_tb/LOout
add wave -noupdate -radix hexadecimal /mul_tb/DUT/BusMuxInLO
add wave -noupdate /mul_tb/LOin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {298531 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 180
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
WaveRestoreZoom {0 ps} {290 ns}
