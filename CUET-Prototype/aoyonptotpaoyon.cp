#line 1 "F:/aoyonptotpaoyon.c"
unsigned short left=0b00000100;
unsigned short center=0b00000010;
unsigned short right=0b00000001;
unsigned short goright=0b00010100;
unsigned short goleft=0b00101000;
unsigned short goforward=0b00101000;
unsigned short gobackward=0b00010100;

unsigned int count=0;
void main ()
{
 trisb=0b00000000;
 portb=0b00000000;
 trisc=0b00111100;
 portc=0b00000000;
 while(1)
 {
 if((portc==left)||(portc==(left|center)))
 portb=goleft;

 if((portc==right)||(portc==(right|center)))
 portb=goright;

 if(portc==center)
 portb=goforward;
 }

}
