transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/REG {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/REG/register_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/MINI_SRC {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/MINI_SRC/miniSRC.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/MINI_SRC {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/MINI_SRC/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/MDI {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/MDI/mux_2_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CONTROL {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CONTROL/select_encode.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CONTROL {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CONTROL/decoder_4_to_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CON_FF {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CON_FF/con_ff.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/BUS {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/BUS/mux_32_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/BUS {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/BUS/encoder_32_to_5.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/sub_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/shra_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/shr_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/shl_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/ror_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/rol_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/or_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/not_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/neg_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/mul_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/IncPC.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/div_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/b_cell.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/and_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/ALU/add_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CONTROL {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/CONTROL/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/IO {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/IO/seven_segment_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/RAM {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/RAM/memory_custom.v}

vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/TESTBENCH {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/Phase3/QuartusProject/TESTBENCH/phase3_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  phase3_tb

add wave *
view structure
view signals
run 500 ns
