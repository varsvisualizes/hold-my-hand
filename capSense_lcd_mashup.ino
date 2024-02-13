/*
 * What is there to even say? We're just getting this booted up and we're gonna hope for the best.
 * Maybe in the future I'll write in VS code and directly publish to GitHub repos, but for now, we're here. :)
 * 
 * Goals:
 * 
 * - Get LCD screen to work (check)
 * - Get capacitive sense to work (check)
 * - Get LCD to react / change based on capactive sense values (SUCCESS!!)
 * 
 * LCD circuit follows this basic schematic, like the Scroll example: 
 *   The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * 10K resistor:
 * ends to +5V and ground
 * wiper to LCD VO pin (pin 3)
 * 
 * Additional visualization help: https://learn.adafruit.com/adafruit-arduino-lesson-11-lcd-displays-1/breadboard-layout
 * 
 * 13 Tues 2024
 * Carmen Peterson <3
 */

#include <CapacitiveSensor.h>
#include "Wire.h"
#include "Adafruit_LiquidCrystal.h"

// initialize the library with the numbers of the interface pins
Adafruit_LiquidCrystal lcd(12, 11, 5, 4, 3, 2);


CapacitiveSensor  cs_6_8 = CapacitiveSensor(6,8); // 100K ohm resistor between pins 6 & 8, 8 is the sensor pin

void setup() {
  // touch sensor stuff

   cs_6_8.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
   Serial.begin(9600);

   // LCD stuff

   // set up the LCD's number of rows and columns: 
  lcd.begin(16, 2);
  lcd.setCursor(0,7);
  // Print a message to the LCD.
  lcd.print("hold my hand?");
  delay(1000);

}

void loop() {
  // put your main code here, to run repeatedly:

    long start = millis();
    long total1 =  cs_6_8.capacitiveSensor(30);
    Serial.println(total1); 

    if(total1 > 20) {

       lcd.clear();
      lcd.print("bless you...");
      lcd.setCursor(1,3);
      lcd.print("thank you...");

      delay(150);
      
      // scroll 13 positions (string length) to the left 
  // to move it offscreen left:
  for (int positionCounter = 0; positionCounter < 13; positionCounter++) {
    // scroll one position left:

    lcd.scrollDisplayLeft(); 
    // wait a bit:
    delay(150);
  }

  // scroll 29 positions (string length + display length) to the right
  // to move it offscreen right:
  for (int positionCounter = 0; positionCounter < 29; positionCounter++) {
    // scroll one position right:
    lcd.scrollDisplayRight(); 
    // wait a bit:
    delay(150);
  }
  
    // scroll 16 positions (display length + string length) to the left
    // to move it back to center:
  for (int positionCounter = 0; positionCounter < 16; positionCounter++) {
    // scroll one position left:
    lcd.scrollDisplayLeft(); 
    // wait a bit:
    delay(150);
  }
  
  // delay at the end of the full loop:
  delay(1000);
      
    }

    else {

    lcd.clear();
    lcd.setCursor(0,7);
    lcd.print("hold my hand?");
    delay(1000);
      
    }

    

}
