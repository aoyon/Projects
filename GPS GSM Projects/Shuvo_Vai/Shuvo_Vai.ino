#include <SD.h>
#include <SoftwareSerial.h>

SoftwareSerial gpsSerial(4, 5); // RX, TX 
const int sentenceSize = 80;

char sentence[sentenceSize];
float latD,longD;
float latDD,longDD;
int latDMSD,latDMSM;
float latDMSS;
int longDMSD,longDMSM;
float longDMSS;
char s = '"';
int CSPin = 2;
int ledPin = 9;
File gpsLog;
boolean ledState = LOW;
long previousMillis = 0; 

void setup()
{
  pinMode(CSPin ,OUTPUT);
  pinMode(ledPin ,OUTPUT);
  Serial.begin(9600);
  gpsSerial.begin(9600);

  Serial.println("Initializing SD Card");

  if(!SD.begin(CSPin))
  {
    Serial.println("SD Card Failed :(");
    while(1)
    {
      ledState=~ledState;
      digitalWrite(ledPin,ledState);
      delay(50);
    }
  }
  Serial.println("SD Card Ready :)");
  gpsLog = SD.open("gpsLog.csv",FILE_WRITE);
  if(gpsLog)
  {
    gpsLog.print("Latitude");
    gpsLog.print(", ");
    gpsLog.println("Longitude");
  }
  else
  {
    Serial.println("Faild to open the file");
    while(1)
    {
      ledState=~ledState;
      digitalWrite(ledPin,ledState);
      delay(200);
    }
  } 
  gpsLog.close();
  ledState=~ledState;
  digitalWrite(ledPin,ledState);
}

void loop()
{
  static int i = 0;
  if (gpsSerial.available())
  {
    char ch = gpsSerial.read();
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
      serialDisplayGPS();
      long currentMillis = millis();
      if(((currentMillis-previousMillis)>2000) && (latDMSD != 24) && (longDMSD != 121) && (longDMSD != 0) && (latDMSD != 0))
      {
        previousMillis = currentMillis;
        gpsLog = SD.open("gpsLog.csv",FILE_WRITE);
        if(gpsLog)
        {
          logGPS_DD();
        }
        else
        {
          Serial.println("Faild to open the file");
        } 
        gpsLog.close(); 
        ledState=~ledState;
        digitalWrite(ledPin,ledState);
      }
    }
  }
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

void logGPS_DMS()
{
  gpsLog.print(latDMSD);
  gpsLog.print((char)176);
  gpsLog.print(latDMSM);
  gpsLog.print("'");
  gpsLog.print(latDMSS);
  gpsLog.print('"');
  gpsLog.print(", ");

  gpsLog.print(longDMSD);
  gpsLog.print((char)176);
  gpsLog.print(longDMSM);
  gpsLog.print("'");
  gpsLog.print(longDMSS);
  gpsLog.println('"');
}

void logGPS_DD()
{
  gpsLog.print(latD,10);
  gpsLog.print(", ");
  gpsLog.println(longD,10);
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










