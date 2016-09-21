/* Serial Loop */
int flexSensorPin1 = A0; //analog pin 0
int flexSensorReading1 = 0;
#include <SoftwareSerial.h>

#define rxPin 10
#define txPin 11

SoftwareSerial BTSerial(rxPin, txPin);

void setup() {
  Serial.begin(9600);
  delay(3000);
  BTSerial.begin(9600);
}

void loop() {
  flexSensorReading1 = analogRead(flexSensorPin1);
  Serial.println(flexSensorReading1);
  BTSerial.println(flexSensorReading1);
  delay(300);
}


