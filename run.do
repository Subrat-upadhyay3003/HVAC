vlib work
vlog HVAC.sv +acc
vlog HVAC_TB.sv +acc
vsim work.HVAC_TB
add wave -r *
run -all
