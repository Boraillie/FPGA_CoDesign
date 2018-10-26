/*
 * AESmain.c
 *
 *  Created on: 26 oct. 2018
 *      Author: Cyril
 */


#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "AES_ip.h"
#include "xparameters.h"
#include "xil_io.h"

void AES_process();

int main()
{
    init_platform();

    AES_process();

    cleanup_platform();

    return 0;
}

void AES_process()
{
    //Reset AES
    print("Reset AES\n\r");
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG8_OFFSET, 0x0);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG8_OFFSET, 0x00000001);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG8_OFFSET, 0x0);

    //Send Key
    int key1, key2, key3, key4;
    print("Type key (space every 8 hex char):\n\r");
    scanf("%d %d %d %d", &key1, &key2, &key3, &key4);

    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG4_OFFSET, key1);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG5_OFFSET, key2);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG6_OFFSET, key3);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG7_OFFSET, key4);
    print("\nKey sent\n\r");

    //Send plain text
    int text1, text2, text3, text4;
    print("Type plain text to encrypt (space every 8 hex char):\n\r");
    scanf("%d %d %d %d", &text1, &text2, &text3, &text4);

    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG0_OFFSET, text1);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG1_OFFSET, text2);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG2_OFFSET, text3);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG3_OFFSET, text4);
    print("\nText sent\n\r");

    //Start AES
    print("Start AES\n\r");
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG9_OFFSET, 0x00000001);

    //Wait for end of AES
    print("Wait for end of AES\n\r");
    //AES_on pas connecte à un registre donc impossible a lire
    for (int i=0; i<1000; i++); //wait

    //Print result
    print("\n\nThe encrypted result is :\n\r");
    int res1, res2, res3, res4;

    res1 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG13_OFFSET);
    res2 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG12_OFFSET);
    res3 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG11_OFFSET);
    res4 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG10_OFFSET);
    printf("%d %d %d %d\n\r", res1, res2, res3, res4);

}

