#include <SoftwareSerial.h>

#define rxPin 2
#define txPin 3

SoftwareSerial mySerial(rxPin, txPin); // RX, TX
String readString;
int ledPin = 13;

void setup()
{
  Serial.begin(9600);
  mySerial.begin(9600);
  pinMode(ledPin, OUTPUT); 
}

void loop()
{
  while (mySerial.available()) {
    delay(3);  
    char c = mySerial.read();
    readString += c; 
  }
  if (readString.length() >0) {
    Serial.println(readString);
    if (readString == "on")     
    {
      digitalWrite(ledPin, HIGH);
    }
    if (readString == "off")
    {
      digitalWrite(ledPin, LOW);
    }
    readString="";
  } 
}

