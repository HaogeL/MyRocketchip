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

## Load MyRocketchip and run on VCU128
After Vivado project is recreated, program VCU128 with bitstream.
### MyRocketchipXSDB 
Enter Xilinx XSDB
```bash
xsdb% connect
tcfchan#0
xsdb% targets                                                                   
  1  xcvu37p
     2  BSCAN JTAG
  3  RISC-V
     4  Hart #0 (Running)
xsdb% target 4                                                                  
xsdb% dow -data MyRocketchip/riscv-pk/build/boot.bin 0x80000000                 
100%   21MB   0.1MB/s  02:43                                                    
Successfully downloaded /home/sprite/Desktop/MyRocketchip/riscv-pk/build/boot.bin
xsdb% con -addr 0x80000000 
```
### MyRocketchipOpenOCD
```bash

```
Connect a console to /dev/USB2 before "xsdb% con -addr 0x80000000", you will see a BBL logo and Linux messages before getting a linux terminal
```bash
bbl loader
              vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                  vvvvvvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrr       vvvvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrr      vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrrrrr      vvvvvvvvvvvvvvvvvvvvvv
rrrrrrrrrrrrr       vvvvvvvvvvvvvvvvvvvvvv
rr                vvvvvvvvvvvvvvvvvvvvvv
rr            vvvvvvvvvvvvvvvvvvvvvvvv      rr
rrrr      vvvvvvvvvvvvvvvvvvvvvvvvvv      rrrr
rrrrrr      vvvvvvvvvvvvvvvvvvvvvv      rrrrrr
rrrrrrrr      vvvvvvvvvvvvvvvvvv      rrrrrrrr
rrrrrrrrrr      vvvvvvvvvvvvvv      rrrrrrrrrr
rrrrrrrrrrrr      vvvvvvvvvv      rrrrrrrrrrrr
rrrrrrrrrrrrrr      vvvvvv      rrrrrrrrrrrrrr
rrrrrrrrrrrrrrrr      vv      rrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrr          rrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrr      rrrrrrrrrrrrrrrrrrrr
rrrrrrrrrrrrrrrrrrrrrr  rrrrrrrrrrrrrrrrrrrrrr

       INSTRUCTION SETS WANT TO BE FREE
[    0.000000] Linux version 5.19.0 (sprite@blade) (riscv64-linux-gnu-gcc (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #1 SMP Sat Dec 10 17:08:57 CET 2022
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] Machine model: freechips,rocketchip-unknown
[    0.000000] earlycon: ns16550a0 at MMIO 0x0000000060001000 (options '')
[    0.000000] printk: bootconsole [ns16550a0] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000000bfffffff]
[    0.000000] SBI specification v0.1 detected
[    0.000000] riscv: base ISA extensions acdfim
[    0.000000] riscv: ELF capabilities acdfim
[    0.000000] percpu: Embedded 18 pages/cpu s34104 r8192 d31432 u73728
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 258055
[    0.000000] Kernel command line: earlycon console=ttyS0,115200n8
[    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Virtual kernel memory layout:
[    0.000000]       fixmap : 0xffffffc6fee00000 - 0xffffffc6ff000000   (2048 kB)
[    0.000000]       pci io : 0xffffffc6ff000000 - 0xffffffc700000000   (  16 MB)
[    0.000000]      vmemmap : 0xffffffc700000000 - 0xffffffc800000000   (4096 MB)
[    0.000000]      vmalloc : 0xffffffc800000000 - 0xffffffd800000000   (  64 GB)
[    0.000000]       lowmem : 0xffffffd800000000 - 0xffffffd83fe00000   (1022 MB)
[    0.000000]       kernel : 0xffffffff80000000 - 0xffffffffffffffff   (2047 MB)
[    0.000000] Memory: 1010060K/1046528K available (6537K kernel code, 4389K rwdata, 4096K rodata, 2648K init, 397K bss, 36468K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
[    0.000000] rcu:     RCU debug extended QS entry/exit.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 10 interrupts with 1 handlers for 2 contexts.
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] riscv_timer_init_dt: Registering clocksource cpuid [0] hartid [0]
[    0.000000] clocksource: riscv_clocksource: mask: 0xffffffffffffffff max_cycles: 0x1d854df40, max_idle_ns: 3526361616960 ns
[    0.000013] sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every 2199023255500ns
[    0.010592] Console: colour dummy device 80x25
[    0.015713] Calibrating delay loop (skipped), value calculated using timer frequency.. 2.00 BogoMIPS (lpj=4000)
[    0.026131] pid_max: default: 32768 minimum: 301
[    0.033909] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.041851] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.076857] cblist_init_generic: Setting adjustable number of callback queues.
[    0.084377] cblist_init_generic: Setting shift to 0 and lim to 1.
[    0.092733] riscv: ELF compat mode failed
[    0.092852] ASID allocator disabled (0 bits)
[    0.103687] rcu: Hierarchical SRCU implementation.
[    0.108773] rcu:     Max phase no-delay instances is 1000.
[    0.118554] EFI services will not be available.
[    0.128548] smp: Bringing up secondary CPUs ...
[    0.133357] smp: Brought up 1 node, 1 CPU
[    0.144524] devtmpfs: initialized
[    0.170037] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.180199] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
[    0.202624] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.216443] cpuidle: using governor menu
[    0.385110] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.398946] iommu: Default domain type: Translated
[    0.404143] iommu: DMA domain TLB invalidation policy: strict mode
[    0.414874] SCSI subsystem initialized
[    0.425277] usbcore: registered new interface driver usbfs
[    0.431879] usbcore: registered new interface driver hub
[    0.438024] usbcore: registered new device driver usb
[    0.455523] vgaarb: loaded
[    0.460303] clocksource: Switched to clocksource riscv_clocksource
[    0.639342] NET: Registered PF_INET protocol family
[    0.648595] IP idents hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.688801] tcp_listen_portaddr_hash hash table entries: 512 (order: 2, 16384 bytes, linear)
[    0.698093] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.706453] TCP established hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.716489] TCP bind hash table entries: 8192 (order: 6, 262144 bytes, linear)
[    0.729618] TCP: Hash tables configured (established 8192 bind 8192)
[    0.738492] UDP hash table entries: 512 (order: 3, 49152 bytes, linear)
[    0.746592] UDP-Lite hash table entries: 512 (order: 3, 49152 bytes, linear)
[    0.757401] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.772837] RPC: Registered named UNIX socket transport module.
[    0.779104] RPC: Registered udp transport module.
[    0.784048] RPC: Registered tcp transport module.
[    0.789121] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.795866] PCI: CLS 0 bytes, default 64
[    0.869011] workingset: timestamp_bits=62 max_order=18 bucket_order=0
[    1.099715] NFS: Registering the id_resolver key type
[    1.106049] Key type id_resolver registered
[    1.110535] Key type id_legacy registered
[    1.116014] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.123203] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    1.167896] 9p: Installing v9fs 9p2000 file system support
[    1.178779] NET: Registered PF_ALG protocol family
[    1.184811] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    1.192591] io scheduler mq-deadline registered
[    1.197381] io scheduler kyber registered
[    2.439404] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    2.468570] printk: console [ttyS0] disabled
[    2.474023] 60000000.serial: ttyS0 at MMIO 0x60001000 (irq = 1, base_baud = 6250000) is a 16550A
[    2.483510] printk: console [ttyS0] enabled
[    2.483510] printk: console [ttyS0] enabled
[    2.492944] printk: bootconsole [ns16550a0] disabled
[    2.492944] printk: bootconsole [ns16550a0] disabled
[    2.606119] loop: module loaded
[    2.636334] e1000e: Intel(R) PRO/1000 Network Driver
[    2.641613] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.650838] xilinx_axienet 60040000.ethernet (unnamed net_device) (uninitialized): Please upgrade your device tree binary blob to use phy-mode
[    2.701168] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.708102] ehci-pci: EHCI PCI platform driver
[    2.713608] ehci-platform: EHCI generic platform driver
[    2.720380] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.727086] ohci-pci: OHCI PCI platform driver
[    2.732680] ohci-platform: OHCI generic platform driver
[    2.743792] usbcore: registered new interface driver uas
[    2.750614] usbcore: registered new interface driver usb-storage
[    2.760049] mousedev: PS/2 mouse device common for all mice
[    2.770110] cpuidle-riscv-sbi: HSM suspend not available
[    2.778211] sdhci: Secure Digital Host Controller Interface driver
[    2.784860] sdhci: Copyright(c) Pierre Ossman
[    2.790060] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.799214] usbcore: registered new interface driver usbhid
[    2.805276] usbhid: USB HID core driver
[    2.818696] NET: Registered PF_INET6 protocol family
[    2.843193] Segment Routing with IPv6
[    2.848465] In-situ OAM (IOAM) with IPv6
[    2.853720] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    2.868630] NET: Registered PF_PACKET protocol family
[    2.876593] 9pnet: Installing 9P2000 support
[    2.882384] Key type dns_resolver registered
[    2.895034] debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table helpers
[    2.931939] Legacy PMU implementation is available
[    2.983075] Freeing unused kernel image (initmem) memory: 2648K
[    2.992639] Run /init as init process


BusyBox v1.33.2 (2022-12-10 16:52:42 CET) built-in shell (ash)
Enter 'help' for a list of built-in commands.

# ifconfig -a
eth0      Link encap:Ethernet  HWaddr 00:11:22:33:44:55
          BROADCAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback
          LOOPBACK  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

sit0      Link encap:UNSPEC  HWaddr 00-00-00-00-00-00-10-FB-00-00-00-00-00-00-00-00
          NOARP  MTU:1480  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

#
```
