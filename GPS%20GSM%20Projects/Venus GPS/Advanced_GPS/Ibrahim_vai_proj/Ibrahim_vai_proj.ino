#include <SoftwareSerial.h>

SoftwareSerial gpsSerial(4, 5); // RX, TX 
const int sentenceSize = 80;

char sentence[sentenceSize];
float latDD,longDD;
int latDMSD,latDMSM;
float latDMSS;
int longDMSD,longDMSM;
float longDMSS;
char s = '"';

void setup()
{
  Serial.begin(9600);
  gpsSerial.begin(9600);
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
     displayGPS_DD();            /// prints the lat and lang
    }
  }
}

void displayGPS_DD()
{
  char field[20];
  getField(field, 0);
  if (strcmp(field, "$GPRMC") == 0)
  {
    getField(field, 3);  // number
    latDD = (atof(field)*10000)/1000000;
    latDMSD = (int)latDD;
    Serial.print(latDMSD);
    Serial.print((char)176);
    latDMSM = (latDD - (int)latDD)*100;
    Serial.print(latDMSM);
    Serial.print("'");
    latDMSS = ( (latDD*100) - (int)(latDD*100) )*60;
    Serial.print(latDMSS);
    Serial.print('"');
    getField(field, 4); // N/S
    Serial.print(field);
    Serial.print(",");

    getField(field, 5);  // number
    longDD = ((atof(field)*100000)/10000000);
    longDMSD = (int)longDD;
    Serial.print(longDMSD);
    Serial.print((char)176);
    longDMSM = ((longDD - (int)longDD)*100);
    Serial.print(longDMSM);
    Serial.print("'");
    longDMSS = ( (longDD*100) - (int)(longDD*100) )*60;
    Serial.print(longDMSS);
    Serial.print('"');
    getField(field, 6);  // E/W
    Serial.println(field); 
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
