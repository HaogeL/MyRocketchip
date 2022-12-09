# An affable Rocketchip Vivado implementation
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Based on [chipsalliance/rocket-chip@tags/v1.6](https://github.com/chipsalliance/rocket-chip/tree/v1.6), an affable single core Rocktchip is configured, with the following features (customizable by updating fields in *MyRocketchipConfig* class): 
- Single rocket core by default. 
- 7 IRQs
- 1 GB Memory range
- Two implementations are provided for debugging with OpenOCD and XSDB.

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
# Get RTL, compatible with Xilinx XSDB
make clean && make verilog CONFIG=freechips.rocketchip.system.MyRocketchipConfig MODEL=MyRocketchip
# Get RTL, compatible with OpenOCD
make clean && make verilog CONFIG=freechips.rocketchip.system.MyRocketchipConfig MODEL=MyRocketchipOpenOCD
```
Check the generated RTL under *rocket-chip/vsim/generated-src*

## Recreate Vivado project

### OpenOCD compatible version
```bash
tar -zxvf MyRocketchipOpenOCD.tar
cd MyRocketchipOpenOCD
vivado -source MyRocketchip.tcl
```

### XSDB compatible version
```bash
tar -zxvf MyRocketchipXSDB.tar
cd MyRocketchipXSDB
vivado -source MyRocketchipXSDB.tcl
```
## Build Linux
