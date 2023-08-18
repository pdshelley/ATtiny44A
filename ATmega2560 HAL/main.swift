//===----------------------------------------------------------------------===//
//
// HAL.swift4a
// Swift For Arduino
//
// Created by Paul Shelley on 11/23/20.
// Copyright © 2020 Paul Shelley. All rights reserved.
//
//===----------------------------------------------------------------------===//


GPIO.pb7.mode(.output)


while(true) {
    // This should work for a basic blink program if you are using a DIP8 ATtiny13A. Connect the LED to pin 7 on the chip with appropriate resistor.
    GPIO.pb7.set(.high)
    waitOneSecond()
    GPIO.pb7.set(.low)
    waitOneSecond()
}
