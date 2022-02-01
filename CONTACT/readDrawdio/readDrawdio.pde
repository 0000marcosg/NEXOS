

import processing.serial.*;
import processing.sound.*;

SinOsc sine;


Serial myPort;  
String val;      
float sensor;

void setup()
{
  size(200, 200);
  
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 57600);
  
  // create and start the sine oscillator.
  sine = new SinOsc(this);
  sine.play();
}

void draw()
{


  if ( myPort.available() > 0) {  
    val = myPort.readStringUntil('\n');
    val = trim(val);
    if (val != null) {
      sensor = float(val);
      println(val);
    }
  }
  
  // Map mouseX from 20Hz to 1000Hz for frequency  
  float frequency = map(sensor, 0, 2500, 80.0, 1000.0);
  
  if (sensor > 1200) {
    sine.amp(1);
    sine.freq(frequency);
  } else {
    sine.amp(0);
  }
}  

