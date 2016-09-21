#line 1 "C:/Users/Zeeshan/Desktop/line/relaytest72.c"
void main()
{
trisc=0b00000000;
portc=0b00000000;

while(1)
{
 portc=0b00000100;
 delay_ms(3000);
 portc=0b00001000;
 delay_ms(3000);
 portc=0b00010000;
 delay_ms(3000);
 portc=0b00100000;
 delay_ms(3000);
}
}
