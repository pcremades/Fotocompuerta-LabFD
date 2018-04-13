
int IRD1=2, IRD2 = 3, IRE1=12, IRE2=11;

void setup() {
  Serial.begin(115200);
  pinMode(IRD1, INPUT_PULLUP);
  pinMode(IRD2, INPUT_PULLUP);
  pinMode(IRE2, OUTPUT);
  pinMode(IRE1, OUTPUT); 
  digitalWrite(IRE1, HIGH); 
  digitalWrite(IRE2, HIGH);
  attachInterrupt(INT0, IRD1int, CHANGE);
  attachInterrupt(INT1, IRD2int, CHANGE);
}

void loop() {
  // put your main code here, to run repeatedly:
  
}

void IRD1int ()
{
    Serial.print("2\t");
    Serial.print(micros());
    Serial.print('\t');
    Serial.println(digitalRead(2));
}
void IRD2int ()
{
    Serial.print("3\t");
    Serial.print(micros());
    Serial.print('\t');
    Serial.println(digitalRead(3));
}
