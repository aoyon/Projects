#include <SPI.h>
#include <SD.h>
#include <SoftwareSerial.h>

char POWER_CTL = 0x2D;	//Power Control Register
char DATA_FORMAT = 0x31;
char DATAX0 = 0x32;	//X-Axis Data 0
char DATAX1 = 0x33;	//X-Axis Data 1
char DATAY0 = 0x34;	//Y-Axis Data 0
char DATAY1 = 0x35;	//Y-Axis Data 1
char DATAZ0 = 0x36;	//Z-Axis Data 0
char DATAZ1 = 0x37;	//Z-Axis Data 1
char values[10];
int x,y,z;

SoftwareSerial deviceSerial(4, 5); // RX, TX 
//SoftwareSerial gsmSerial(A1, A2); // RX, TX 
const int sentenceSize = 80;

char sentence[sentenceSize];
float latD,longD;
float latDD,longDD;
int latDMSD,latDMSM;
float latDMSS;
int longDMSD,longDMSM;
float longDMSS;
boolean gpsDisp = false;
char s = '"';
int CSAccelero = 10;
int CSPin = 2;
int ledPin = 9;
boolean ledState = LOW; 


void setup()
{
  pinMode(CSAccelero ,OUTPUT);
  pinMode(CSPin ,OUTPUT);
  pinMode(ledPin ,OUTPUT);
  Serial.begin(9600);
  deviceSerial.begin(9600);
//  gsmSerial.begin(9600);
  
  SPI.begin();
  SPI.setDataMode(SPI_MODE3);
  writeRegister(DATA_FORMAT, 0x01);
  writeRegister(POWER_CTL, 0x08);
  
}

void loop()
{
  acceleration();
  static int i = 0;
  if (deviceSerial.available())
  {
    char ch = deviceSerial.read();
    if (ch != '\n' && i < sentenceSize)
    {
      sentence[i] = ch;
      i++;
    }
    else
    {
      sentence[i] = '\0';
      i = 0;
      getGPS();
      if((gpsDisp == true) && (latDMSD != 24) && (longDMSD != 121) && (longDMSD != 0) && (latDMSD != 0))
      {
        digitalWrite(ledPin,HIGH);
        serialDisplayGPS();
        send_sms();
        delay(1000);
        digitalWrite(ledPin,LOW);
        gpsDisp = false;
      }
    }
  }
}


void writeRegister(char registerAddress, char value)
{
  digitalWrite(CSAccelero, LOW);
  SPI.transfer(registerAddress);
  SPI.transfer(value);
  digitalWrite(CSAccelero, HIGH);
}

void readRegister(char registerAddress, int numBytes, char * values)
{
  char address = 0x80 | registerAddress;
  if(numBytes > 1)address = address | 0x40;

  digitalWrite(CSAccelero, LOW);
  SPI.transfer(address);
  for(int i=0; i<numBytes; i++){
    values[i] = SPI.transfer(0x00);
  }
  digitalWrite(CSAccelero, HIGH);
}

void acceleration()
{
  readRegister(DATAX0, 6, values); 
  x = ((int)values[1]<<8)|(int)values[0];
  y = ((int)values[3]<<8)|(int)values[2];
  z = ((int)values[5]<<8)|(int)values[4];
  
//  Serial.print(x, DEC);
//  Serial.print(',');
//  Serial.print(y, DEC);
//  Serial.print(',');
//  Serial.println(z, DEC);      
//  delay(10); 

  if((x>=125)||(x<=-125))
    gpsDisp = true;
}


void serialDisplayGPS()
{
  Serial.print(latDMSD);
  Serial.print((char)176);
  Serial.print(latDMSM);
  Serial.print("'");
  Serial.print(latDMSS);
  Serial.print('"');
  Serial.print(", ");

  Serial.print(longDMSD);
  Serial.print((char)176);
  Serial.print(longDMSM);
  Serial.print("'");
  Serial.print(longDMSS);
  Serial.print('"');

  Serial.print("  <->  ");

  Serial.print(latD,10);
  Serial.print(", ");
  Serial.println(longD,10);
}

void send_sms()
{
//  deviceSerial.write("AT+CMGS=\"01723762058\"");
  deviceSerial.write("AT+CMGS=\"01716994446\"");
  delay(150);
  deviceSerial.write(13);
  delay(150);
  deviceSerial.println("!! SOS !! Accident occured !!!  Help PLEASE... ");
  delay(150);
  deviceSerial.println("Location : CUET,Raojan,Chittagong Co-ordinates:");
  delay(150);
  deviceSerial.println(latD,8);
  delay(150);
  deviceSerial.println("N , ");
  delay(150);
  deviceSerial.println(longD,8);
  delay(150);
  deviceSerial.println("E");
  delay(150);
  deviceSerial.write(26);
  delay(500);
}

void getGPS()
{
  char field[20];
  getField(field, 0);
  if (strcmp(field, "$GPRMC") == 0)
  {
    getField(field, 3);  // number
    latDD = (atof(field)*10000)/1000000;
    latDMSD = (int)latDD;
    latDMSM = (latDD - (int)latDD)*100;
    latDMSS = ( (latDD*100) - (int)(latDD*100) )*60;
    //latD = (float)latDMSD + (float)(latDMSM/60.0000000000) + (float)(latDMSS/3600.0000000000);
    latD = (int)latDD + (((latDD-(int)latDD)*100)/60.0000000000);

    getField(field, 5);  // number
    longDD = ((atof(field)*100000)/10000000);
    longDMSD = (int)longDD;
    longDMSM = ((longDD - (int)longDD)*100);
    longDMSS = ( (longDD*100) - (int)(longDD*100) )*60;
    //longD = (float)longDMSD + (float)(longDMSM/60.0000000000) + (float)(longDMSS/3600.0000000000);
    longD = (int)longDD + (((longDD-(int)longDD)*100)/60.0000000000);
  }
}


void getField(char* buffer, int index)
{
  int sentencePos = 0;
  int fieldPos = 0;
  int commaCount = 0;
  while (sentencePos < sentenceSize)
  {
    if (sentence[sentencePos] == ',')
    {
      commaCount ++;
      sentencePos ++;
    }
    if (commaCount == index)
    {
      buffer[fieldPos] = sentence[sentencePos];
      fieldPos ++;
    }
    sentencePos ++;
  }
  buffer[fieldPos] = '\0';
} 

