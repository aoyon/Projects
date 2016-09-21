
int s1,s2;

void setup()
{
  Serial.begin(9600);
}

void loop()
{
  s1 = analogRead(A0);
  s2 = analogRead(A1);
  
  Serial.print(s1);
  Serial.print("*");
  Serial.println(s2);
  delay(100);
}
