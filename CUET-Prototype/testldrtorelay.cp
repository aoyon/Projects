#line 1 "C:/Users/Zeeshan/Desktop/line/testldrtorelay.c"

void main()
{
trisb=0b00000111;
trisc=0b00000000;
portb=0b00000000;
portc=0b00000000;

while(1)
{
 if(portb==0b00000001)
 {
 portc=0b00000100;
 }
 if(portb==0b00000010)
 {
 portc=0b00001000;
 }
 if(portb==0b00000100)
 {
 portc=0b00010000;
 }
}
}
