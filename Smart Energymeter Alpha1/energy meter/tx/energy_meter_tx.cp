#line 1 "C:/Users/S. Farhan/Desktop/New folder (2)/energy_meter_tx.c"
short int count;


void main()
{
trisb = 0b00000001;
portb = 0b00000000;
trisc = 0b00000000;
portc = 0b00000000;
 count = 0;
 while(1)
 {
 while(!portb.f0);
 while(portb.f0)
 { count++;
 if(count==16)
 {
 count=1;
 }
 while(portb.f0);
 }
 portc=count;
 portb.f1=0;
 delay_us(100);
 portb.f1=1;
 }
}
