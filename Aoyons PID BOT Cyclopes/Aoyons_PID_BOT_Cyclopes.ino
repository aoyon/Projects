/*
Cyclopes 1.0 Line Follower Bot
Author : Aoyon
Based on Arduino uno
*/
#include <LiquidCrystal.h>
#include <Servo.h>
#include <EEPROM.h>

#define RS 12
#define EN 8
#define D4 2
#define D5 3
#define D6 4
#define D7 7

#define upPin 0
#define selectPin 1
#define downPin 13

#define rightMotorPin 9
#define leftMotorPin 10

LiquidCrystal lcd(RS,EN,D4,D5,D6,D7);

/*Sensor Related Variables*/
unsigned int sensor[] = {
  0,0,0,0,0};
unsigned int sensorState[] = {
  0,0,0,0,0};
unsigned int sensorThresHold = 800;

float sensorSum = 0.00;
float sensorWeightedValue = 0.00;
/*Sensor Related Variables*/

/*Bot Position Related Variables*/
float botPosition = 0.00;
float setPoint = 3.00;
int checkPoints = 0;
/*Bot Position Related Variables*/

/*Motor Related Variables*/
int rightSpeed = 0;
int leftSpeed = 0;
int maxSpeed = 255;
/*Motor Related Variables*/

/*PID Realted Variables*/
float integral = 0;
float proportional = 0;
float lastProportional= 0;
float derivative = 0;
float error = 0;
float Kp=0;
float Ki=0;
float Kd=0;
/*PID Realted Variables*/

/*Setup Variables */
boolean start = false;
int selectCount = 0;
int setupMode = 0;
/*Setup Variables */



float eepromReadFloat(int address)
{
  union u_tag {
    byte b[4];
    float fval;
  } 
  u;   
  u.b[0] = EEPROM.read(address);
  u.b[1] = EEPROM.read(address+1);
  u.b[2] = EEPROM.read(address+2);
  u.b[3] = EEPROM.read(address+3);
  return u.fval;
}

void eepromWriteFloat(int address, float value)
{
  union u_tag {
    byte b[4];
    float fval;
  } 
  u;
  u.fval=value;

  EEPROM.write(address  , u.b[0]);
  EEPROM.write(address+1, u.b[1]);
  EEPROM.write(address+2, u.b[2]);
  EEPROM.write(address+3, u.b[3]);
}

int setInt(int a)
{
  delay(100);
  lcd.setCursor(0,1);
  lcd.print(a);
  while(digitalRead(selectPin) == LOW)
  {
    delay(100);
    if(digitalRead(upPin) == HIGH)
    {
      delay(100);
      a++;
      lcd.setCursor(0,1);
      lcd.print(a);
    }
    if(digitalRead(downPin) == HIGH)
    {
      delay(100);
      a--;
      lcd.setCursor(0,1);
      lcd.print(a);
      lcd.print("    ");
    }
  }
  while(digitalRead(selectPin) == HIGH);
  delay(100);
  return (a);
}


float setFloat(float a)
{
  delay(100);
  lcd.setCursor(0,1);
  lcd.print(a);

  while(digitalRead(selectPin) == LOW)
  {
    delay(100);
    if(digitalRead(upPin) == HIGH)
    {
      delay(100);
      a*=10;
      a++;
      a/=10;
      lcd.setCursor(0,1);
      lcd.print(a);
    }
    if(digitalRead(downPin) == HIGH)
    {
      delay(100);
      a*=10;
      a--;
      a/=10;
      lcd.setCursor(0,1);
      lcd.print(a);
      lcd.print("    ");
    }
  }
  while(digitalRead(selectPin) == HIGH);
  return (a);
}

void sensorInit()
{
  delay(100);
  lcd.setCursor(0,1);
  lcd.print(sensorThresHold);
  while(digitalRead(selectPin) == LOW)
  {
    delay(100);
    if(digitalRead(upPin) == HIGH)
    {
      delay(100);
      sensorThresHold = sensorThresHold + 10;
      lcd.setCursor(0,1);
      lcd.print(sensorThresHold);
    }
    if(digitalRead(downPin) == HIGH)
    {
      delay(100);
      sensorThresHold = sensorThresHold - 10;
      lcd.setCursor(0,1);
      lcd.print(sensorThresHold);
      lcd.print("    ");
    }
  }
  while(digitalRead(selectPin) == HIGH);
  delay(100);
}

void showSensorFeed(int a)
{
  delay(100);
  while(digitalRead(selectPin) == LOW)
  {
    readSensors();
    if(digitalRead(upPin) == HIGH)
    {
      a++;
      if(a > 5) 
      {
        a = 0;
      }
      delay(100);
    }
    if(digitalRead(downPin) == HIGH)
    {
      a--;
      if(a < 0) 
      {
        a = 5;
      }
      delay(100);
    }
    if(a <= 4)
    {
      lcd.setCursor(0,0);
      lcd.print("Sensor->   ");
      lcd.setCursor(11,0);
      lcd.print(a);
      lcd.setCursor(12,0);
      lcd.print("     ");
      lcd.setCursor(0,1);
      lcd.print(sensor[a]);
      lcd.print("             ");
    }
    if(a == 5)
    {
      lcd.setCursor(0,0);
      lcd.print("Bot Pos. -> ");
      lcd.setCursor(12,0);
      lcd.print(botPosition);
      lcd.setCursor(0,1);
      lcd.print("SM=");
      lcd.setCursor(3,1);
      lcd.print(sensorSum);
      lcd.setCursor(8,1);
      lcd.print("SWV=");
      lcd.setCursor(12,1);
      lcd.print(sensorWeightedValue);
    }    
    delay(100);
  }
  while(digitalRead(selectPin) == HIGH);
}

void sensorPosition()
{
  delay(100);
  while(digitalRead(selectPin) == LOW)
  {
    readSensors();
    lcd.setCursor(0,0);
    lcd.print("Sen. THLD ->");
    lcd.setCursor(13,0);
    lcd.print(sensorThresHold);
    lcd.setCursor(2,1);
    lcd.print(sensorState[0]);
    lcd.setCursor(5,1);
    lcd.print(sensorState[1]);
    lcd.setCursor(8,1);
    lcd.print(sensorState[2]);
    lcd.setCursor(11,1);
    lcd.print(sensorState[3]);
    lcd.setCursor(14,1);
    lcd.print(sensorState[4]);
    delay(100);
  }
  while(digitalRead(selectPin) == HIGH);
}

int setupModeSelect()
{
  while(digitalRead(selectPin) == LOW)
  {
    if(digitalRead(upPin) == HIGH)
    {
      delay(100);
      setupMode++;
      if(setupMode > 1)
      {
        setupMode = 0;
      }
    }
    if(digitalRead(downPin) == HIGH)
    {
      delay(100);
      setupMode--;
      if(setupMode < 0)
      {
        setupMode = 1;
      }
    }
    if(setupMode == 0)
    {
      lcd.setCursor(0,1);
      lcd.print("< NORMAL >  ");
      delay(100);
    }
    if(setupMode == 1)
    {
      lcd.setCursor(0,1);
      lcd.print("< ADVANCED >");
      delay(100);
    }
  }
  delay(100);
  return(setupMode);
}


void botSetup()
{
  ++ selectCount;
  if(selectCount == 1)
  {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Setup Mode ->>");
    setupMode = setupModeSelect();
    if(setupMode == 0)
    {
      selectCount = 8;
    }
    if(setupMode == 1)
    {
      selectCount = 2;
    }
  }
  
  if(selectCount == 2)
  {
    lcd.clear();
    showSensorFeed(2);
    ++ selectCount;
  }

  if(selectCount == 3)
  {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Sensor THLD -->");
    sensorInit();
    ++ selectCount;
  }
  delay(100);

  if(selectCount == 4)
  {
    lcd.clear();
    sensorPosition();
    ++ selectCount;
  }
  delay(100);

  if(selectCount == 5)
  {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Setup Kp -->");
    Kp = setInt(Kp);
    ++ selectCount;
  }
  delay(100);
  if(selectCount == 6)
  {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Setup Ki -->");
    Ki = setFloat(Ki);
    ++ selectCount;
  }
  delay(100);
  if(selectCount == 7)
  {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Setup Kd -->");
    Kd = setInt(Kd);
    ++ selectCount;
  }
  delay(100);
  if(selectCount == 8)
  {
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("Check Points -->");
    checkPoints = setInt(checkPoints);
    ++ selectCount;
  }
  delay(100);
  if(selectCount > 8)
  {
    eepromWriteFloat(0,Kp);
    eepromWriteFloat(5,Ki);
    eepromWriteFloat(10,Kd);
    eepromWriteFloat(15,checkPoints);
    eepromWriteFloat(20,sensorThresHold);
    lcd.clear();
    lcd.setCursor(0,0);
    lcd.print("All Var are SET");
    lcd.setCursor(0,1);
    lcd.print("Let's Rock&Roll");
    delay(3000);
    start = true;
  }
  delay(100);
}

float readSensors()
{
  sensorSum = 0.00;
  sensorWeightedValue = 0.00;

  for(int i=0; i<5; i++)
  {
    sensor[i] = analogRead(i);
  }

  for(int i=0; i<5; i++)
  {
    if(sensor[i] >= sensorThresHold)
    {
      sensorState[i] = 1;
    }
    if(sensor[i] < sensorThresHold)
    {
      sensorState[i] = 0;
    }
  }

  sensorSum = float(sensorState[0]+sensorState[1]+sensorState[2]+sensorState[3]+sensorState[4]);
  sensorWeightedValue = float((sensorState[0]*1)+(sensorState[1]*2)+(sensorState[2]*3)+(sensorState[3]*4)+(sensorState[4]*5));
  botPosition = float(sensorWeightedValue/sensorSum);
  return botPosition;
}

void PIDCalc(int botPosition)
{
  proportional = botPosition - setPoint; //error
  derivative = proportional - lastProportional;
  integral = integral + proportional;
  lastProportional = proportional;

  error = int((proportional*Kp) + (integral*Ki) + (derivative*Kd));
}

void turnCalc()
{
  if(error < -255) 
  { 
    error = -255; 
  }
  if(error > 255)
  { 
    error = 255;  
  }
  if(error < 0)
  {
    rightSpeed = maxSpeed + error;
    leftSpeed = maxSpeed;
  }
  if(error > 0)
  {
    rightSpeed = maxSpeed;
    leftSpeed = maxSpeed - error;
  }

  else
  {
    rightSpeed = maxSpeed;
    leftSpeed = maxSpeed;
  }
}

void motorDrive(int rightSpeed,int leftSpeed)
{
  analogWrite(rightMotorPin,rightSpeed);
  analogWrite(leftMotorPin,leftSpeed);
}

void setup()
{
  pinMode(selectPin,INPUT);
  pinMode(upPin,INPUT);
  pinMode(downPin,INPUT);
  pinMode(rightMotorPin,OUTPUT);
  pinMode(leftMotorPin,OUTPUT);
  lcd.begin(16, 2);
  lcd.setCursor(0,0);
  lcd.print(" CYCLOPES V1.0");
  lcd.setCursor(0,1);
  lcd.print("   Let's ROCK");
  delay(1000);
  lcd.clear();
  Kp = eepromReadFloat(0);
  Ki = eepromReadFloat(5);
  Kd = eepromReadFloat(10);
  checkPoints = eepromReadFloat(15);
  sensorThresHold = eepromReadFloat(20);

  botSetup();

  pinMode(selectPin,OUTPUT);
  pinMode(upPin,OUTPUT);
  pinMode(downPin,OUTPUT);
  //setPoint = setPointCalc();
}


void loop()
{
  if(start == true)
  {
    lcd.clear();
    lcd.print("BOT Up&Running");
    digitalWrite(13,HIGH);
    delay(1000);
    //    PIDCalc(botPosition);
    //    turnCalc();
    //    motorDrive(rightSpeed,leftSpeed);
  }
  else
  {
    lcd.clear();
    lcd.print("Failed to Initialize");
  }
}
