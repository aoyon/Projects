#include <SPI.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd(10);  //(or the latch pin of the 74HC595)

void setup() { 
  lcd.begin(16, 2);
  lcd.print("SPI LCD Demo");
}

void loop() {
  lcd.setCursor(0, 1);
  lcd.print("By SidewindeR");
  lcd.setCursor(15, 1);
  lcd.print(millis()/1000);
}
