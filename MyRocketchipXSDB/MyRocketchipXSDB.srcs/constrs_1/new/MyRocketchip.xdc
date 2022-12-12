create_clock -name TCK -period 50 [get_pins -hier -filter {name =~ */io_jtag_TCK}]
set_input_delay 15 -clock_fall -clock [get_clocks TCK] [get_pins -hier -filter {name =~ */INTERNAL_TDI}]
set_input_delay 15 -clock_fall -clock [get_clocks TCK] [get_pins -hier -filter {name =~ */INTERNAL_TMS}]