connect -url tcp:127.0.0.1:3121
source D:/Documents/Cours/EMSE/3A/Embedded_Systems/FPGA_CoDesign/Projet_AES_2018/AES_2018/AES_2018.sdk/system_wrapper_hw_platform_3/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248553121"} -index 0
loadhw -hw D:/Documents/Cours/EMSE/3A/Embedded_Systems/FPGA_CoDesign/Projet_AES_2018/AES_2018/AES_2018.sdk/system_wrapper_hw_platform_3/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zed 210248553121"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248553121"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248553121"} -index 0
dow D:/Documents/Cours/EMSE/3A/Embedded_Systems/FPGA_CoDesign/Projet_AES_2018/AES_2018/AES_2018.sdk/AES_1/Debug/AES_1.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zed 210248553121"} -index 0
con
