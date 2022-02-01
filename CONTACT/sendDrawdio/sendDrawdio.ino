/* FreqMeasure - Example with serial output
 * http://www.pjrc.com/teensy/td_libs_FreqMeasure.html
 *
 * This example code is in the public domain.
 */
#include <FreqMeasure.h>

void setup() {
  Serial.begin(57600);
  FreqMeasure.begin();
}

double sum=0;
int count=0;

void loop() {
  if (FreqMeasure.available()) {
    // average several reading together
    sum = sum + FreqMeasure.read();
    count = count + 1;
    if (count > 50) {
      float frequency = FreqMeasure.countToFrequency(sum / count);
      int f = (int) frequency;
      Serial.println(f);
      sum = 0;
      count = 0;
    }
  }
  
}

