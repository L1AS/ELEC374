onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /or_tb/clock
add wave -noupdate -radix unsigned /or_tb/Present_state
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR1
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR2
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR3
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR4
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR5
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR6
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR7
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR8
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR9
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR10
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR11
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR12
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR13
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR14
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInR15
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInHI
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInLO
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInZhigh
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxInZlow
add wave -noupdate -radix hexadecimal /or_tb/DUT/IRout
add wave -noupdate -radix hexadecimal /or_tb/DUT/BusMuxOut
add wave -noupdate -radix hexadecimal /or_tb/Mdatain
add wave -noupdate /or_tb/operation
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {261654 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 184
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
WaveRestoreZoom {108503 ps} {267974 ps}
