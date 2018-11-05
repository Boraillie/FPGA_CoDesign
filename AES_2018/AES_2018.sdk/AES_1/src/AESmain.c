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
    unsigned int key1, key2, key3, key4;
    print("Type key :\n\r");
    scanf("%x %x %x %x", &key1, &key2, &key3, &key4);
    printf("%x %x %x %x\n", key1, key2, key3, key4);

    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG4_OFFSET, key1);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG5_OFFSET, key2);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG6_OFFSET, key3);
    AES_IP_mWriteReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG7_OFFSET, key4);
    print("\nKey sent\n\r");

    //Send plain text
    unsigned int text1, text2, text3, text4;
    print("Type plain text to encrypt :\n\r");
    scanf("%x %x %x %x", &text1, &text2, &text3, &text4);
    printf("%x %x %x %x\n", text1, text2, text3, text4);

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
    //AES_on pas connecte � un registre donc impossible a lire
    for (int i=0; i<10000; i++); //wait

    //Print result
    print("\n\nThe encrypted result is :\n\r");
    unsigned int res1, res2, res3, res4;

    res1 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG13_OFFSET);
    res2 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG12_OFFSET);
    res3 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG11_OFFSET);
    res4 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG10_OFFSET);
    printf("%x %x %x %x\n\r", res1, res2, res3, res4);

    //Print registres
    print("\n\nThe registers :\n\r");
	unsigned int textR1, textR2, textR3, textR4;

	textR1 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG0_OFFSET);
	textR2 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG1_OFFSET);
	textR3 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG2_OFFSET);
	textR4 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG3_OFFSET);
	printf("%x %x %x %x\n\r", textR1, textR2, textR3, textR4);

	unsigned int keyR1, keyR2, keyR3, keyR4;

	keyR1 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG4_OFFSET);
	keyR2 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG5_OFFSET);
	keyR3 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG6_OFFSET);
	keyR4 = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG7_OFFSET);
	printf("%x %x %x %x\n\r", keyR1, keyR2, keyR3, keyR4);


	unsigned int startR = AES_IP_mReadReg(XPAR_AES_IP_0_S_AES_AXI_BASEADDR, AES_IP_S_AES_AXI_SLV_REG9_OFFSET);
	printf("AES_on ? %x", startR);

}

