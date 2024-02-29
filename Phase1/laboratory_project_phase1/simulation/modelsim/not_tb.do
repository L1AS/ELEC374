onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /not_tb/clock
add wave -noupdate -radix unsigned /not_tb/Present_state
add wave -noupdate -radix hexadecimal /not_tb/Mdatain
add wave -noupdate /not_tb/operation
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxInPC
add wave -noupdate /not_tb/PCin
add wave -noupdate /not_tb/PCout
add wave -noupdate /not_tb/IncPC
add wave -noupdate -radix binary /not_tb/DUT/IRout
add wave -noupdate /not_tb/IRin
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxInMAR
add wave -noupdate /not_tb/MARin
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxInMDR
add wave -noupdate /not_tb/MDRin
add wave -noupdate /not_tb/MDRout
add wave -noupdate /not_tb/Read
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxInR6
add wave -noupdate /not_tb/R6in
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxInR7
add wave -noupdate /not_tb/R7out
add wave -noupdate /not_tb/Zlowout
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxInZlow
add wave -noupdate /not_tb/Zin
add wave -noupdate -radix hexadecimal /not_tb/DUT/alu_out
add wave -noupdate -radix hexadecimal /not_tb/DUT/BusMuxOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {266100 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 176
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {260 ns}
