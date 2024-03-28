transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/IncPC.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/REG {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/REG/register_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/MINI_SRC {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/MINI_SRC/miniSRC.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/MINI_SRC {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/MINI_SRC/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/MDI {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/MDI/mux_2_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CONT {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CONT/select_encode.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CONT {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CONT/decoder_4_to_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CON_FF {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CON_FF/flip_flop.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/BUS {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/BUS/mux_32_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/BUS {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/BUS/encoder_32_to_5.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/sub_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/shra_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/shr_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/shl_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/ror_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/rol_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/or_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/not_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/neg_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/mul_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/div_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/b_cell.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/and_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/ALU/add_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CON_FF {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/CON_FF/con_ff.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/RAM {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/RAM/memory.v}

vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/TESTBENCHES {C:/Users/sheng/Documents/ELEC374/Phase2/QuartusProject/TESTBENCHES/ALU_imm_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  ALU_imm_tb

add wave *
view structure
view signals
run 500 ns
