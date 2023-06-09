const int buttonPin1 = 2;
int buttonState1 = 0;

const int buttonPin2 = 3;
int buttonState2 = 0;

const int buttonPin3 = 4;
int buttonState3 = 0;

int buzzerPin = 13;  


#define trigPin 11
#define echoPin 12

#define NOTE_C6 1047
#define NOTE_D6 1157
#define NOTE_E6 1319
#define NOTE_F6 1397
#define NOTE_G6 1568
#define NOTE_A6 1760
#define NOTE_B6 1976
#define NOTE_C7 2093

void setup() {
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);


  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  pinMode(buzzerPin, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  buttonState1 = digitalRead(buttonPin1);
  if (buttonState1 == HIGH) {
    Serial.println('1');
    delay(100);
  } 


 buttonState2 = digitalRead(buttonPin2);
  if (buttonState2 == HIGH) {
    Serial.println('2');
    delay(100);
  } 
 

   buttonState3 = digitalRead(buttonPin3);
  if (buttonState3 == HIGH) {
    Serial.println('3');
    delay(100);
  } 
 
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  unsigned long duration = pulseIn(echoPin, HIGH);
  float distance = duration * 0.034 / 2;

  Serial.println(distance);
  delay(900);

   
  if (Serial.available()) {
    char command = Serial.read();
    delay(100);
    if (command == '5') {
      tone(buzzerPin, 700);
    } else if (command == '0') {
      noTone(buzzerPin);
    } else if( command=='6'){
      playMusic();
    }
  }

}

void playMusic() {
tone(buzzerPin, NOTE_A6, 500);
delay(500);
tone(buzzerPin, NOTE_A6, 500);
delay(500);
tone(buzzerPin, NOTE_B6, 500);
delay(500);
tone(buzzerPin, NOTE_G6, 500);
delay(500);
tone(buzzerPin, NOTE_A6, 500);
delay(500);
tone(buzzerPin, NOTE_B6, 500);
delay(200);
tone(buzzerPin, NOTE_C7, 500);
delay(300);
tone(buzzerPin, NOTE_B6, 500);
delay(500);
tone(buzzerPin, NOTE_G6, 500);
delay(500);
tone(buzzerPin, NOTE_A6, 500);
delay(500);
tone(buzzerPin, NOTE_B6, 500);
delay(200);
tone(buzzerPin, NOTE_C7, 500);
delay(300);
tone(buzzerPin, NOTE_B6, 500);
delay(500);
tone(buzzerPin, NOTE_A6, 500);
delay(500);
tone(buzzerPin, NOTE_G6, 500);
delay(500);
tone(buzzerPin, NOTE_A6, 500);
delay(500);
}