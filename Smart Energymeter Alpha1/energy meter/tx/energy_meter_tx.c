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
      { count++;              //increment
        if(count==16)           // checking overflow
         {
         count=1;
         }
         while(portb.f0);        //waiting for LDR to set 0
      }
   portc=count;                // sending to encoader
   portb.f1=0;             // enabel transmission
   delay_us(100);
   portb.f1=1;              // transmission terminate
   }
}