#include <ezButton.h>
#include <Servo.h>


// Set the toggleSwitch Pin
ezButton toggleSwitch(4);
Servo NUBEEServo;
const int NUBEEServoPin = 9;
int sensorPin = A0;
int microphonePin = 1;

// Setup section to run once
void setup() {
  // For Serial Output
  Serial.begin(9600);
  NUBEEServo.attach(NUBEEServoPin);  // Attach to Pin 9
  NUBEEServo.write(0);   // Stop the motor
  pinMode(sensorPin, INPUT); // Set SensorPin
  pinMode(microphonePin, INPUT);
}

// Loop to keep the motor turning!
void loop() {
  // Read the Switch State
  toggleSwitch.loop();

  // Get the Switch State
  int SWState = toggleSwitch.getState();
  if (SWState == HIGH) {
    // TODO: Code when the Switch is Off
    Serial.println("bye");
  }
  else {
    // TODO: Code when the Switch is On
    int mn = 1024;
    int mx = 0;

    for (int i = 0; i < 5000; ++i) {
      int val = analogRead(sensorPin);
      mn = min(mn, val);
      mx = max(mx, val);
    }
    int delta = mx - mn;
    Serial.println(delta);
    Serial.println(digitalRead(microphonePin));
    if (delta > 5) {
      int cicle = 0;
      while(cicle < 25){
        toggleSwitch.loop();
        int SWState = toggleSwitch.getState();
        if (SWState == HIGH) {
          break;
        }
        NUBEEServo.write(0);
        delay(500);
        NUBEEServo.write(180);
        delay(500);
        cicle++;
      }
      
      delay(5000);
    }
    
  }
  delay(200);
}
