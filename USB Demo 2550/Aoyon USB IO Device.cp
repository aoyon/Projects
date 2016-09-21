#line 1 "F:/RMA/MY Projects/USB Demo 2550/Aoyon USB IO Device.c"
unsigned char readbuff[64] absolute 0x500;
unsigned char writebuff[64] absolute 0x540;

void interrupt(){
 USB_Interrupt_Proc();
}

unsigned int adc_rdchn0;
unsigned int adc_rdchn1;
unsigned int adc_rdchn2;
unsigned int adc_rdchn3;
unsigned int adc_rdchn4;
unsigned int temp;


void main(void){


ADCON1 = 0b00001010;
CMCON |= 7;

TRISB = 0;
PORTB = 0;
TRISC = 0;
PORTC = 0;

ADC_Init();
HID_Enable(&readbuff,&writebuff);

 while(1){

 if(HID_Read())
 {
 if(readbuff[40] == 1)
 {
 TRISB = 255;
 }
 if(readbuff[41] == 1)
 {
 TRISB = 0;
 }
 if(readbuff[42] == 1)
 {
 TRISC = 255;
 }
 if(readbuff[43] == 1)
 {
 TRISC = 0;
 }


 if(readbuff[30] == 1)
 {
 PORTB.RB0 =~ PORTB.f0;
 readbuff[30] = 0;
 }
 if(readbuff[31] == 1)
 {
 PORTB.f1 =~ PORTB.f1;
 readbuff[31] = 0;
 }
 if(readbuff[32] == 1)
 {
 PORTB.f2 =~ PORTB.f2;
 readbuff[32] = 0;
 }
 if(readbuff[33] == 1)
 {
 PORTB.f3 =~ PORTB.f3;
 readbuff[33] = 0;
 }
 if(readbuff[34] == 1)
 {
 PORTB.f4 =~ PORTB.f4;
 readbuff[34] = 0;
 }
 if(readbuff[35] == 1)
 {
 PORTB.f5 =~ PORTB.f5;
 readbuff[35] = 0;
 }
 if(readbuff[36] == 1)
 {
 PORTB.f6 =~ PORTB.f6;
 readbuff[36] = 0;
 }
 if(readbuff[37] == 1)
 {
 PORTB.f7 =~ PORTB.f7;
 readbuff[37] = 0;
 }




 if(readbuff[21] == 1)
 {
 PORTC.RC0 =~ PORTC.f0;
 readbuff[21] = 0;
 }
 if(readbuff[22] == 1)
 {
 PORTC.f1 =~ PORTC.f1;
 readbuff[22] = 0;
 }
 if(readbuff[23] == 1)
 {
 PORTC.f2 =~ PORTC.f2;
 readbuff[23] = 0;
 }
 if(readbuff[24] == 1)
 {
 PORTC.f6 =~ PORTC.f6;
 readbuff[24] = 0;
 }
 if(readbuff[25] == 1)
 {
 PORTC.f7 =~ PORTC.f7;
 readbuff[25] = 0;
 }

 }





 else
 {

 if(PORTB.f0 == 1)
 {
 writebuff[30] = 1;
 }
 else
 {
 writebuff[30] = 0;
 }
 if(PORTB.f1 == 1)
 {
 writebuff[31] = 1;
 }
 else
 {
 writebuff[31] = 0;
 }
 if(PORTB.f2 == 1)
 {
 writebuff[32] = 1;
 }
 else
 {
 writebuff[32] = 0;
 }
 if(PORTB.f3 == 1)
 {
 writebuff[33] = 1;
 }
 else
 {
 writebuff[33] = 0;
 }
 if(PORTB.f4 == 1)
 {
 writebuff[34] = 1;
 }
 else
 {
 writebuff[34] = 0;
 }
 if(PORTB.f5 == 1)
 {
 writebuff[35] = 1;
 }
 else
 {
 writebuff[35] = 0;
 }
 if(PORTB.f6 == 1)
 {
 writebuff[36] = 1;
 }
 else
 {
 writebuff[36] = 0;
 }
 if(PORTB.f7 == 1)
 {
 writebuff[37] = 1;
 }
 else
 {
 writebuff[37] = 0;
 }






 if(PORTC.f0 == 1)
 {
 writebuff[21] = 1;
 }
 else
 {
 writebuff[21] = 0;
 }

 if(PORTC.f1 == 1)
 {
 writebuff[22] = 1;
 }
 else
 {
 writebuff[22] = 0;
 }

 if(PORTC.f2 == 1)
 {
 writebuff[23] = 1;
 }
 else
 {
 writebuff[23] = 0;
 }

 if(PORTC.f6 == 1)
 {
 writebuff[24] = 1;
 }
 else
 {
 writebuff[24] = 0;
 }

 if(PORTC.f7 == 1)
 {
 writebuff[25] = 1;
 }
 else
 {
 writebuff[25] = 0;
 }


 adc_rdchn0 = ADC_Read(0);
 writebuff[11] = (char)adc_rdchn0;
 writebuff[12] = (char)(adc_rdchn0 >> 8);


 adc_rdchn1 = ADC_Read(1);
 writebuff[13] = (char)adc_rdchn1;
 writebuff[14] = (char)(adc_rdchn1 >> 8);


 adc_rdchn2 = ADC_Read(2);
 writebuff[15] = (char)adc_rdchn2;
 writebuff[16] = (char)(adc_rdchn2 >> 8);


 adc_rdchn3 = ADC_Read(3);
 writebuff[17] = (char)adc_rdchn3;
 writebuff[18] = (char)(adc_rdchn3 >> 8);


 adc_rdchn4 = ADC_Read(4);
 writebuff[19] = (char)adc_rdchn4;
 writebuff[20] = (char)(adc_rdchn4 >> 8);
#line 282 "F:/RMA/MY Projects/USB Demo 2550/Aoyon USB IO Device.c"
 while(!HID_Write(&writebuff,64));
 Delay_ms(5);
 }
 }
}
