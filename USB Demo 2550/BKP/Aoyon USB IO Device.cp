#line 1 "F:/RMA/MY Projects/USB Demo 2550/n/Aoyon USB IO Device.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

void interrupt(){
 USB_Interrupt_Proc();
}

unsigned int adc_rd;

void main(void){


ADCON1 = 0;
CMCON |= 7;

TRISC.RC0 = 0;
PORTC.RC0 = 0;
TRISC.RC1 = 0;
PORTC.RC1 = 0;

ADC_Init();
HID_Enable(&readbuff,&writebuff);

 while(1){

 if(HID_Read())
 {
 if(readbuff[62] == 1)
 {
 PORTC.RC0 = 1;
 readbuff[62] = 0;
 }
 if(readbuff[63] == 1)
 {
 PORTC.RC0 = 0;
 readbuff[63] = 0;
 }

 if(readbuff[60] == 1)
 {
 PORTC.RC1 = 1;
 readbuff[64] = 0;
 }

 if(readbuff[61] == 1)
 {
 PORTC.RC1 = 0;
 readbuff[65] = 0;
 }
 }
 else
 {
 adc_rd = ADC_Read(4);
 adc_rd = adc_rd/2;
 writebuff[11] = (char)adc_rd;
 writebuff[12] = (char)(adc_rd >> 8);
 while(!HID_Write(&writebuff,64));
 Delay_ms(5);
 }


 }
}
