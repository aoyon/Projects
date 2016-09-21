#line 1 "H:/line/a1173.c"
unsigned short left=0b00000011;
unsigned short hardleft=0b00000001;
unsigned short right=0b00000110;
unsigned short hardright=0b00000100;
unsigned short center=0b00000010;

unsigned short forward=0b00100100;
unsigned short goleft=0b00100000;
unsigned short goright=0b00000100;
unsigned short backward=0b00011000;
unsigned short stop=0b00000000;

unsigned short offline=0b00000000;
unsigned short online=0b00000111;
unsigned int count=0;

void main ()
{
 trisb=0b00000111;
 portb=0b00000000;
 trisc=0b00000000;
 portc=0b00000000;
 while(1)
 {
 if(portb==left)
 portc=goleft;

 if(portb==right)
 portc=goright;

 if((portb==center)||(portb==hardright)||(portb==hardleft))
 portc=forward;
 if((portb==offline))
 portc=goleft;
 delay_ms(10);
 }

}
