#include <SD.h>

int CSPin = 2;
int n = 0;
void setup()
{
  pinMode(CSPin ,OUTPUT);
  
  Serial.begin(9600);
  Serial.println("Initializing SD Card");
  
  if(!SD.begin(CSPin))
  {
    Serial.println("SD Card Failed :(");
    return;
  }
  Serial.println("SD Card Ready :)");
}

void loop()
{
  File myFile = SD.open("myFile.txt",FILE_WRITE);
  n++;
  if(myFile)
  {
    myFile.print("SidewindeR's SD Card Project ");
    myFile.println(n);
    myFile.close();
    Serial.print("SidewindeR's SD Card Project ");
    Serial.println(n);
  }
  else
  {
    Serial.println("Faild to open the file");
  }
  
  delay(5000);
}
  
  
