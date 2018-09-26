# ZedBoard Pin Assignments
############################
# On-board Slide Switches  #
############################
set_property -dict { PACKAGE_PIN F22   IOSTANDARD LVCMOS33 } [get_ports { swt[0] }];
set_property -dict { PACKAGE_PIN G22   IOSTANDARD LVCMOS33 } [get_ports { swt[1] }];
set_property -dict { PACKAGE_PIN H22   IOSTANDARD LVCMOS33 } [get_ports { swt[2] }];
set_property -dict { PACKAGE_PIN F21   IOSTANDARD LVCMOS33 } [get_ports { swt[3] }];
set_property -dict { PACKAGE_PIN H19   IOSTANDARD LVCMOS33 } [get_ports { swt[4] }];
set_property -dict { PACKAGE_PIN H18   IOSTANDARD LVCMOS33 } [get_ports { swt[5] }];
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { swt[6] }];
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports { swt[7] }];

############################
# On-board led             #
############################
set_property -dict { PACKAGE_PIN T22   IOSTANDARD LVCMOS33 } [get_ports { led[0] }];
set_property -dict { PACKAGE_PIN T21   IOSTANDARD LVCMOS33 } [get_ports { led[1] }];
set_property -dict { PACKAGE_PIN U22   IOSTANDARD LVCMOS33 } [get_ports { led[2] }];
set_property -dict { PACKAGE_PIN U21   IOSTANDARD LVCMOS33 } [get_ports { led[3] }];
set_property -dict { PACKAGE_PIN V22   IOSTANDARD LVCMOS33 } [get_ports { led[4] }];
set_property -dict { PACKAGE_PIN W22   IOSTANDARD LVCMOS33 } [get_ports { led[5] }];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { led[6] }];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { led[7] }];