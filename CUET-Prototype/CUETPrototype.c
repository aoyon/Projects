
// CUET Prototype Line Tracker Algorithms //
// Inputs on Port B Pin No. b0,b1,b2  //
// outputs on Port C Pin No. c2,c3,c4,c5 //

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

//On line tracking//
  
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

//On line tracking//
       
//Out of trac calculation//

    if(portb==offline)
    {
       if(m==left||m==hardleft)
           portc=gohardleft;
       if(m==right||m==hardright)
           portc=gohardright;
       if(m==checkpoint)
          {
          if(count==2)
              portc=gohardleft;      //on semi 90//
          if(count==3)
              portc=gohardright;     //on hard 90//
          if(count==4)
              portc=gohardright;     //on hard 90//

          //return trip//
              
          if(count==11)
              portc=gohardleft;      //on hard 90//
          if(count==12)
              portc=gohardleft;      //on hard 90//
          if(count==13)
              portc=gohardright;     //on semi 90//
              }
          }
      
 //Out of trac calculation//



// Counting Checkpoints //


    if(portb==checkpoint)
    {
       count=count+1;
       portc=forward;
       while(portb==checkpoint);
       }

// Counting Checkpoints //

// Counting Checkpoint Controlled Operations //

    if(count==7)
    {
       portc=forward;
       delay_ms(2000);
       portc=gohardright;
       delay_ms(2500);
       }



   }

}
