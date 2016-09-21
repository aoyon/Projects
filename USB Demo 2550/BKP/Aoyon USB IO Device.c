unsigned char readbuff[64] absolute 0x500;   // Buffers should be in USB RAM, please consult datasheet
unsigned char writebuff[64] absolute 0x540;

void interrupt(){
   USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
}

unsigned int adc_rd;

void main(void){


ADCON1 = 0;
CMCON  |= 7;         // Disable comparators

TRISC.RC0 = 0;
PORTC.RC0 = 0;
TRISC.RC1 = 0;
PORTC.RC1 = 0;

ADC_Init();
HID_Enable(&readbuff,&writebuff);  // Enable HID communication

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
   writebuff[11] = (char)adc_rd;        //low
   writebuff[12] = (char)(adc_rd >> 8); //High
   while(!HID_Write(&writebuff,64));        //Send to PC
   Delay_ms(5);
  }


  }
}