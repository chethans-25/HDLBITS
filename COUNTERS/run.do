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
