onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /phase3_tb/clock
add wave -noupdate /phase3_tb/reset
add wave -noupdate /phase3_tb/stop
add wave -noupdate /phase3_tb/run
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/control/present_state
add wave -noupdate /phase3_tb/DUT/DUT/alu_opcode
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/PC/q
add wave -noupdate -radix binary /phase3_tb/DUT/IR/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/IR/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/MDR/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/RAM/data_out
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/RAM/data_in
add wave -noupdate /phase3_tb/DUT/RAM/write_enable
add wave -noupdate /phase3_tb/DUT/RAM/read_enable
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/RAM/addr
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/alu_out
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R0/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R1/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R2/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R3/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R4/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R5/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R6/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R7/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R8/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R9/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R10/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R11/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R12/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R13/q
add wave -noupdate /phase3_tb/DUT/DUT/R14/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/R15/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/Zhigh/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/Zlow/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/HI/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/DUT/LO/q
add wave -noupdate -radix hexadecimal /phase3_tb/DUT/branch_condition/busMuxOut
add wave -noupdate /phase3_tb/DUT/DUT/busMux/busMuxSignal
add wave -noupdate -radix hexadecimal {/phase3_tb/DUT/RAM/memory[71]}
add wave -noupdate -radix hexadecimal {/phase3_tb/DUT/RAM/memory[142]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2545463 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 432
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
WaveRestoreZoom {2538 ns} {2698 ns}
