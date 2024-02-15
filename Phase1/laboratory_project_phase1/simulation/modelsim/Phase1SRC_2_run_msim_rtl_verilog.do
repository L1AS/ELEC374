transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/b_cell.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/REG {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/REG/register_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS/mux_32_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS/mux_2_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS/encoder_32_to_5.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/BUS/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/sub_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/shra_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/shr_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/shl_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/ror_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/rol_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/or_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/not_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/neg_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/mul_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/div_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/and_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/ALU/add_op.v}

vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/Testbenches {C:/Users/19tja3/Documents/ELEC374/Phase1/laboratory_project_phase1/Testbenches/sub_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  sub_tb

add wave *
view structure
view signals
run 500 ns
