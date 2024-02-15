transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1 {C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1/cla_gen_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1 {C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1/cla_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1 {C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1/full_adder.v}

vlog -vlog01compat -work work +incdir+C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1/cla_gen_test/.. {C:/Users/sheng/Documents/ELEC374/ELEC374/laboratory_project_phase1/cla_gen_test/../cla_gen_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  cla_gen_tb

add wave *
view structure
view signals
run 500 ns
