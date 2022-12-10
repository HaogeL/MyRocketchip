# An affable Rocketchip Vivado implementation
[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Based on [chipsalliance/rocket-chip@tags/v1.6](https://github.com/chipsalliance/rocket-chip/tree/v1.6), an affable single core Rocktchip is configured, with the following features (customizable by updating fields in *MyRocketchipConfig* class): 
- Single rocket core by default. 
- 7 IRQs
- 1 GB Memory range
- Two implementations are provided for debugging with OpenOCD and XSDB.

## Build RTL
Setup your own env by following instructions in [rocket-chip](https://github.com/chipsalliance/rocket-chip) first.
```bash
git clone https://github.com/HaogeL/MyRocketchip.git
cd MyRocketchip
git submodule update --init --recursive rocket-chip
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
## Build Software
### Busybox
```bash
cd <MyRocketchip>
git submodule update --init --recursive busybox
cd busybox
git checkout tags/1_33_2
cp ../busybox.config ./.config
make CROSS_COMPILE=riscv64-linux-gnu-
```

### Rootfs
Build Busybox first.
```bash
cd <MyRocketchip>
mkdir root
cd root
mkdir -p bin etc dev lib proc sbin sys tmp usr usr/bin usr/lib usr/sbin
cp ../busybox/busybox bin/busybox
ln -s bin/busybox sbin/init
ln -s bin/busybox init
cp ../inittab ./etc/inittab
sudo mknod dev/console c 5 1
find . | cpio --quiet -o -H newc | gzip > ../rootfs.cpio.gz
```

### Linux kernel
Build Rootfs first.
```bash
cd <MyRocketchip>
git clone https://github.com/torvalds/linux.git
cd linux
git checkout v5.19
cp ../linux.config ./.config
cp ../driver.patch .
git apply phy.patch
cp ../rootfs.cpio.gz .
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- vmlinux
```

### Berkeley bootloader (BBL)
```bash
cd <MyRocketchip>
git clone https://github.com/riscv/riscv-pk
cd riscv-pk
git checkout 7e9b671c0415dfd
mkdir build
cd build
../configure --host=riscv64-linux-gnu \
             --with-payload=../../linux/vmlinux \
             --with-dts=../../MyRocketchip.dts \
             --enable-logo
make
cp bbl.bin boot.bin
```
