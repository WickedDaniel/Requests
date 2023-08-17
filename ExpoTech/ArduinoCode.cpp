int buzzerPin = 8;
int sensorPin = A0;
bool turned = false;

void setup(){
  pinMode(buzzerPin, OUTPUT);
  pinMode(sensorPin, INPUT);
  Serial.begin (9600);
}
  
void loop (){
  if(analogRead(sensorPin)> 80)
  {
    Serial.println("SNORING");
    if(turned == false){
     turned = true;
     tone(buzzerPin, 10000, 5000);
     delay(5000);
     turned = false;
    }
  }
  else{
    noTone(buzzerPin);
  }
}
