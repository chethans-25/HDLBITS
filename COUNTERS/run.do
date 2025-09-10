#Need to run these code in Questa terminal to run count_clock and count_clock_tb

if {![file exists work]} {
    vlib work
}
vopt +acc=a
vlog count_clock.v count_clock_tb.v
vsim -voptargs="+acc" count_clock_tb
add wave -r /count_clock_tb/inst/*


run 1500us

view wave
wave zoom full
