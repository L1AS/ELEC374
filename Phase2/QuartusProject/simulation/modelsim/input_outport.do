onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /input_output_tb/clock
add wave -noupdate -radix hexadecimal /input_output_tb/Present_state
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/IR/q
add wave -noupdate /input_output_tb/IRin
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/PC/q
add wave -noupdate /input_output_tb/PCout_en
add wave -noupdate /input_output_tb/IncPC
add wave -noupdate /input_output_tb/PC_en
add wave -noupdate -radix hexadecimal /input_output_tb/outPortData
add wave -noupdate /input_output_tb/outPort_en
add wave -noupdate -radix hexadecimal /input_output_tb/inPortDataIn
add wave -noupdate /input_output_tb/inPort_en
add wave -noupdate /input_output_tb/inPortOut
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/MDR/q
add wave -noupdate /input_output_tb/MDRin
add wave -noupdate /input_output_tb/MDRout
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/MAR/q
add wave -noupdate /input_output_tb/MARin
add wave -noupdate /input_output_tb/memRead
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/DUT/Zlow/q
add wave -noupdate /input_output_tb/Zin
add wave -noupdate /input_output_tb/Zlowout
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/DUT/R3/q
add wave -noupdate /input_output_tb/CPU/DUT/R3/enable
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/DUT/R4/q
add wave -noupdate /input_output_tb/CPU/DUT/R4/enable
add wave -noupdate /input_output_tb/Gra
add wave -noupdate /input_output_tb/Rin
add wave -noupdate /input_output_tb/Rout
add wave -noupdate -radix hexadecimal /input_output_tb/CPU/busMuxOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {269044 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
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
WaveRestoreZoom {150 ns} {525 ns}
