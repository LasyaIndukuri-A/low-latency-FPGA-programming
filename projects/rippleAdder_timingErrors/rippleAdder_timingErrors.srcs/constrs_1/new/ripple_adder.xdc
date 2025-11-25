create_clock -name clk -period 10 [get_ports clk]
# 2.5 ns period = 400 MHz target (aggressive on purpose)
set_input_delay 0.2 -clock clk [get_ports a*]
set_input_delay 0.2 -clock clk [get_ports b*]
set_output_delay 0.2 -clock clk [get_ports sum*]