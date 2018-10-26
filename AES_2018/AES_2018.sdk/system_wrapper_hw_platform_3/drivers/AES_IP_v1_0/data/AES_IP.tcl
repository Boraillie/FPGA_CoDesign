

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "AES_IP" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AES_AXI_BASEADDR" "C_S_AES_AXI_HIGHADDR"
}
