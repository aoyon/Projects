#include <Servo.h> 

Servo Servo1;
Servo Servo2;
Servo Servo3;
Servo Servo4;
Servo Servo5;

char command = ' ';
int pos = 0;

void down()
{
  for(pos = 50; pos < 100; pos += 1)
  {                                  
    Servo3.write(pos);
    Servo4.write(pos);    
    delay(15);                       
  }
  Servo5.write(0);
}

void up()
{


  for(pos = 100; pos>=30; pos-=1)   
  {                                
    Servo3.write(pos);           
    delay(15);                       
  } 
}
void left()
{


  for(pos = 0; pos<=180; pos+=1)   
  {                                
    Servo1.write(pos);           
    delay(15);                       
  } 
}

void right()
{


  for(pos = 180; pos>=0; pos-=1)   
  {                                
    Servo1.write(pos);           
    delay(15);                       
  } 
}

void grip()
{
  for(pos = 0; pos < 150; pos += 1)
  {                                  
    Servo5.write(pos);              
    delay(15);                      
  }  
}

void setup() 
{ 
  Serial.begin(9600);
  Serial.println("Arm Alive");
  
  Servo1.attach(6);            //Servo at the base Freedom 0-180
  Servo2.attach(5);            //Two Servo at the upper base Freedom 0-160
  Servo3.attach(2);            //Servo at the Elbow Freedom 50-140
  Servo4.attach(3);            //Servo at the Wrist Freedom 50-140
  Servo5.attach(4);            //Servo at the Griper Freedom 50-150
  
  Servo1.write(0);
  Servo2.write(0);
  Servo3.write(0);
  Servo4.write(0);
  Servo5.write(0);
} 


void loop() 
{
  while(!Serial.available());

  command = Serial.read();

  switch(command)
  {
  case 'd':
    down();
    Serial.println("Servo Down");
    break;
  case 'u':
    up();
    Serial.println("Servo up");
    break;
  case 'g':
    grip();
    Serial.println("Servo Gripped");
    break;
  case 'l':
    left();
    Serial.println("Servo Left");
    break;
  case 'r':
    right();
    Serial.println("Servo Right");
    break;
  default:
    Serial.println("Invalid!!");
    break;
  }
}




