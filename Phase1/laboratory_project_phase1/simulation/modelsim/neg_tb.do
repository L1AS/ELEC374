onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /neg_tb/clock
add wave -noupdate -radix unsigned /neg_tb/Present_state
add wave -noupdate -radix hexadecimal /neg_tb/Mdatain
add wave -noupdate /neg_tb/operation
add wave -noupdate /neg_tb/PCout
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxInPC
add wave -noupdate /neg_tb/PCin
add wave -noupdate /neg_tb/IncPC
add wave -noupdate -radix hexadecimal /neg_tb/DUT/IRout
add wave -noupdate /neg_tb/IRin
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxInMAR
add wave -noupdate /neg_tb/MARin
add wave -noupdate /neg_tb/MDRout
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxInMDR
add wave -noupdate /neg_tb/MDRin
add wave -noupdate /neg_tb/Read
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxInR6
add wave -noupdate /neg_tb/R6in
add wave -noupdate /neg_tb/R7out
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxInR7
add wave -noupdate /neg_tb/R7in
add wave -noupdate /neg_tb/Zlowout
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxInZlow
add wave -noupdate /neg_tb/Zin
add wave -noupdate -radix hexadecimal /neg_tb/DUT/alu_out
add wave -noupdate -radix hexadecimal /neg_tb/DUT/BusMuxOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {308414 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 236
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {250 ns}
