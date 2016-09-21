#include <SD.h>

int CSPin = 10;
float average = 0;
float tempC;
int tempPin = 0;
int n = 0;
void setup()
{
  pinMode(CSPin ,OUTPUT);
  analogReference(INTERNAL);
  Serial.begin(9600);
  Serial.println("Initializing SD Card");
  
  if(!SD.begin(CSPin))
  {
    Serial.println("SD Card Failed :(");
    return;
  }
  Serial.println("SD Card Ready :)");
  
  File logFile = SD.open("TempLOG.csv",FILE_WRITE);
  
  if(logFile)
  {
    logFile.println("ID, Temp C");
    logFile.close();
    Serial.println("ID, Temp C");
  }
  else
  {
    Serial.println("Faild to open TempLOG.csv");
    return;
  }
}

void loop()
{
  average = 0;
  for(int i = 0;i < 100;i++)
  {
    average = average + analogRead(tempPin);
    delay(10);
  }
  tempC = average / 100;
  //tempC = (5.0 * tempC * 100.0)/1024.0;
  tempC = tempC/9.310;
  File logFile = SD.open("TempLOG.csv",FILE_WRITE);
  
  if(logFile)
  {
    logFile.print(n);
    logFile.print(", ");
    logFile.println(tempC);
    logFile.close();
    Serial.print(n);
    Serial.print(", ");
    Serial.println(tempC);
  }
  else
  {
    Serial.println("Faild to open the file");
  }
  n++;
}
  
  
