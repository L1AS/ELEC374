transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/sub_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/shr_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/shra_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/shl_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/ror_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/rol_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/register_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/or_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/not_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/neg_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/mux_32_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/mux_2_to_1.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/mul_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/IncPC.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/encoder_32_to_5.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/div_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/and_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/add_op.v}
vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/Datapath.v}

vlog -vlog01compat -work work +incdir+C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1 {C:/Users/trist/OneDrive/Documents/GitHub/ELEC374/laboratory_project_phase1/and_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  and_tb

add wave *
view structure
view signals
run 500 ns