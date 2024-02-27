onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /add_tb/clock
add wave -noupdate -radix unsigned /add_tb/Present_state
add wave -noupdate -radix hexadecimal /add_tb/Mdatain
add wave -noupdate /add_tb/operation
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR0
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR1
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR2
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR3
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR4
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR5
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR6
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR7
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR8
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR9
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR10
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR11
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR12
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR13
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR14
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInR15
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInHI
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInLO
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInZhigh
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxInZlow
add wave -noupdate -radix hexadecimal /add_tb/DUT/BusMuxOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {161688 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {273 ns}
