#An affable rocketchip
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Based on [chipsalliance/rocket-chip@tags/v1.6](https://github.com/chipsalliance/rocket-chip/tree/v1.6), an affable single core Rocktchip is configured, with the following features (customizable by updating fields in *MyRocketchipConfig* class): 
- Single rocket core by default. 
- 7 IRQs
- 1 GB Memory range
- Exposed Jtag interface
    - Or hidden Jtag interface driven by Xilinx Bscan2 primitive, which is compatible with OpenOCD

## To build RTL
Setup your own env by following instructions in [rocket-chip](https://github.com/chipsalliance/rocket-chip) first.
```bash
git clone https://github.com/HaogeL/MyRocketchip.git
cd MyRocketchip
git submodule update --init --recursive
cd rocket-chip
git checkout tags/v1.6
git apply ../MyRocketchip.patch
cd vsim
make clean && make verilog CONFIG=freechips.rocketchip.system.MyRocketchipConfig MODEL=MyRocketchip
# to build hide Jtag interface
make clean && make verilog CONFIG=freechips.rocketchip.system.MyRocketchipConfig MODEL=MyRocketchipOpenOCD
```

Check the generated RTL under *rocket-chip/vsim/generated-src*

## FPGA implementation 
