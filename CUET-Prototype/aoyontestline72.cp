#line 1 "C:/Users/SidewindeR/Desktop/line/aoyontestline72.c"
unsigned short left=0b00000011;
unsigned short hardleft=0b00000001;
unsigned short right=0b00000110;
unsigned short hardright=0b00000100;
unsigned short center=0b00000010;

unsigned short forward=0b00100100;
unsigned short goleft=0b00101000;
unsigned short goright=0b00010100;
unsigned short backward=0b00011000;

unsigned short offline=0b00000000;
unsigned short online=0b00000111;
unsigned int count=0;

void main ()
{
 trisb=0b00000000;
 portb=0b00000000;
 trisc=0b00111100;
 portc=0b00000000;
 while(1)
 {
 if((portc==left)||(portc==hardleft))
 portb=goleft;

 if((portc==right)||(portc==hardright))
 portb=goright;

 if((portc==center)||(portc==online))
 portb=forward;

 if(portc==offline)
 portb=backward;

 }

}
