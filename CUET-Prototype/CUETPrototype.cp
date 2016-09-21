#line 1 "C:/Users/SidewindeR/Desktop/line/CUETPrototype.c"





unsigned short left=0b00000011;
unsigned short hardleft=0b00000001;
unsigned short right=0b00000110;
unsigned short hardright=0b00000100;
unsigned short center=0b00000010;

unsigned short forward=0b00100100;
unsigned short goleft=0b00100000;
unsigned short goright=0b00000100;
unsigned short gohardleft=0b00101000;
unsigned short gohardright=0b00010100;

unsigned short backward=0b00011000;
unsigned short stop=0b00000000;

unsigned short offline=0b00000000;
unsigned short checkpoint=0b00000111;
unsigned int count=0;
unsigned short m=255;

void main ()

{

 trisb=0b00000111;
 portb=0b00000000;
 trisc=0b00000000;
 portc=0b00000000;

 while(1)
 {



 if((portb==center)||(portb==left)||(portb==right))
 {
 portc=forward;
 m=portb;
 }

 if(portb==hardleft)
 {
 portc=goleft;
 m=portb;
 }

 if(portb==hardright)
 {
 portc=goright;
 m=portb;
 }





 if(portb==offline)
 {
 if(m==left||m==hardleft)
 portc=gohardleft;
 if(m==right||m==hardright)
 portc=gohardright;
 if(m==checkpoint)
 {
 if(count==2)
 portc=gohardleft;
 if(count==3)
 portc=gohardright;
 if(count==4)
 portc=gohardright;



 if(count==11)
 portc=gohardleft;
 if(count==12)
 portc=gohardleft;
 if(count==13)
 portc=gohardright;
 }
 }








 if(portb==checkpoint)
 {
 count=count+1;
 portc=forward;
 while(portb==checkpoint);
 }





 if(count==7)
 {
 portc=forward;
 delay_ms(2000);
 portc=gohardright;
 delay_ms(2500);
 }



 }

}
