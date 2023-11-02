#include <Servo.h>
#include <ezButton.h>

ezButton toggleSwitch(8);
Servo myservo;

// Setup section to run once
void setup() {
  Serial.begin(9600);
  myservo.attach(9); // attach the servo to our servo object
  toggleSwitch.setDebounceTime(50);
  myservo.write(0); // stop the motor
}

// Loop to keep the motor turning!
void loop() {
  toggleSwitch.loop();
  if (toggleSwitch.isPressed())
    Serial.println("The switch: OFF -> ON");

  if (toggleSwitch.isReleased())
    Serial.println("The switch: ON -> OFF");

  int state = toggleSwitch.getState();
  if (state == HIGH)
    Serial.println("The switch: OFF");
  else{
    Serial.println("The switch: ON");
    myservo.write(0); // rotate the motor counter-clockwise
    delay(500); // keep rotating for 5 seconds (5000 milliseconds)
    Serial.println(myservo.read());
    myservo.write(180); // rotate the motor clockwise
    delay(500); // keep rotating 😀
  }

  
}
