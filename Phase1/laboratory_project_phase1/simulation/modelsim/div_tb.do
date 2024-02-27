onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /div_tb/clock
add wave -noupdate -radix unsigned /div_tb/Present_state
add wave -noupdate /div_tb/operation
add wave -noupdate /div_tb/PCout
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInPC
add wave -noupdate /div_tb/PCin
add wave -noupdate /div_tb/IncPC
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInPC
add wave -noupdate -radix hexadecimal /div_tb/DUT/IRout
add wave -noupdate /div_tb/IRin
add wave -noupdate -radix hexadecimal /div_tb/Mdatain
add wave -noupdate /div_tb/Read
add wave -noupdate /div_tb/MARin
add wave -noupdate /div_tb/MDRout
add wave -noupdate -radix hexadecimal /div_tb/DUT/MDRMuxOut
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxOut
add wave -noupdate /div_tb/R4out
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInR4
add wave -noupdate /div_tb/R4in
add wave -noupdate /div_tb/R5out
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInR5
add wave -noupdate /div_tb/R5in
add wave -noupdate /div_tb/Yin
add wave -noupdate -radix hexadecimal /div_tb/DUT/Yout
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInZhigh
add wave -noupdate /div_tb/Zhighout
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInZlow
add wave -noupdate /div_tb/Zlowout
add wave -noupdate /div_tb/Zin
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInHI
add wave -noupdate /div_tb/HIin
add wave -noupdate -radix hexadecimal /div_tb/DUT/BusMuxInLO
add wave -noupdate /div_tb/LOin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {297136 ps} 0}
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
WaveRestoreZoom {0 ps} {290 ns}
