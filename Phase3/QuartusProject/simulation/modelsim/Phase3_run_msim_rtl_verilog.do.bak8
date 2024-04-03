transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase3/QuartusProject/RAM {C:/Users/19tja3/Documents/ELEC374/Phase3/QuartusProject/RAM/memory_custom.v}

vlog -vlog01compat -work work +incdir+C:/Users/19tja3/Documents/ELEC374/Phase3/QuartusProject/RAM {C:/Users/19tja3/Documents/ELEC374/Phase3/QuartusProject/RAM/memory_custom.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  memory_test

add wave *
view structure
view signals
run 500 ns
