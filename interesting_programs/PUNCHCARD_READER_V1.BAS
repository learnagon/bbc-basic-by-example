   10 REM PUNCHCARD READER V1
   20 REM SOURCE: ARDUINING.COM
   30 :
   40 REM #define clock 8
   42 clock=8
   50 :
   60 REM #define data_bit 9
   62 data_bit=9
   70 :
   80 REM byte data_byte;
   82 data_byte%=0
   90 :
  100 REM void setup(){
  110 REM   pinMode(clock, INPUT_PULLUP);
  120 REM   pinMode(data_bit, INPUT_PULLUP);
  130 REM   Serial.begin(9600);
  140 REM }
  150 :
  160 :
  170 :
  180 :
  190 :
  200 REM void loop(){
  210 REM   data_byte = 0;
  220 REM   while(digitalRead(clock)==0);
  230 REM   delay(100); //debounce
  240 REM   for(int i=0; i<8; i++){
  250 REM     while(digitalRead(clock)==1){};
  260 REM     delay(100);
  270 REM     while(digitalRead(clock)==0);
  280 REM     delay(100);
  290 REM     data_byte=data_byte << 1;
  300 REM     data_byte=data_byte | !(digitalRead(data_bit));
  310 REM     Serial.print(!(digitalRead(data_bit)));
  315 PRINT data_bit;
  320 REM   }
  330 REM   while(digitalRead(clock)==1){};
  340 REM   delay(100);
  350 REM   Serial.print(" = ");
  355 PRINT" = ";
  360 REM   Serial.write(data_byte);
  365 PRINT data_byte
  370 REM   Serial.println("");//send a LF
  375 PRINT
  380 REM }
  390 :
  400 :
  410 :
  420 :
  430 :
  440 :
  450 :
  460 :
  470 :
  480 :
  490 :
  500 :
  580 END
