//===----------------------------------------------------------------------===//
//
// HAL.swift4a
// Swift For Arduino
//
// Created by Paul Shelley on 11/23/20.
// Copyright © 2020 Paul Shelley. All rights reserved.
//
//===----------------------------------------------------------------------===//

// Setup for blink()
arduinoUno.a5.mode(.input)
arduinoUno.pin11.mode(.output)
arduinoUno.pin3.mode(.output)
//analogWrite(value: 140)

// Setup for transmit()
setupSerial(baudRate: 57600)


// Setup for recieve()
//setupSerial(baudRate: 57600)
//activateRxInterruptHandler()

/// NOTE: 
/// synchronous analog read functions
/// Read the value of one of the 6 analog pins. The voltage will be from 0-1023
/// and will be by comparison to the voltage at AREF.  Note this read will both
/// block until complete and will activate the ADC if not active. If this is the
/// first reading after power on or sleep and the ADC is being activated, you
/// may need to take a few readings to stabilise.

func startupAdc() {
    AnalogeDigitalConverter.voltageReferenceSelection = .AVccWithExternalCapacitorAtAnalogReferencePin
    AnalogeDigitalConverter.prescalerSelectBits = .Factor128
    AnalogeDigitalConverter.enableADC = true

    delayMilliSeconds(ms: 1000)
}

startupAdc()
var stuff: UInt = 0
var thing: Bool = false

while(true) {
    //    AnalogeDigitalConverter.voltageReferenceSelection = .Internal11VoltageReferenceWithExternalCapacitorAtAnalogRefererancePin
    AnalogeDigitalConverter.analogChannelSelectionBits = .ADC5
    AnalogeDigitalConverter.startConversion = true
    
    while(AnalogeDigitalConverter.startConversion){}
    
    let adcl = UInt(AnalogeDigitalConverter.ADCL)
    let adch = UInt(AnalogeDigitalConverter.ADCH)
    stuff = UInt(AnalogeDigitalConverter.DataRegister)
    //    let adcl = UInt(AnalogeDigitalConverter.ADCL)
    //    let adch = UInt(AnalogeDigitalConverter.ADCH)
    
    delayMilliSeconds(ms: 1000)
}
    
//    startupAdc() //? order of operation
    //AnalogeDigitalConverter.ControlAndStatusRegisterA |= 1 << UInt8(AnalogeDigitalConverter.startConversion);
    
//    let analogValue = Float(AnalogeDigitalConverter.DataRegister)
//    let digitalValue = UInt16(analogValue/5.0 * 1023.0)
    
    
//    var a = analogRead(pin: 0)
//    
//    let test: Float = 0.165
//    
//    write(test, decimalPlaces: 3)
//    write(0x0A)
//    write(UInt(a))
//    
//    write(0x0A)
//    
//    var b = UInt8(Float(a) / 1024.0 * 255)
//     
//    //write(b)
//     
//    analogWrite(value: b)
}

//public func analogWrite( value: UInt16) {
//// TODO: Put the implmentation from the ArduinoAVRCore here. Because HAL will do a lot of the abstraction we will only need a much smaller layer for each specific chipset and this layer will live in the ArduinoCore.
////
//    
//    arduinoUno.pin9.mode(.output)
//    
//    if(value == 0) {
//        arduinoUno.pin9.set(.low)
//    }
//    else if (value == 255) {
//        arduinoUno.pin9.set(.high)
//    }
//    else {
//        Timer1.waveformGenerationMode = .fastPWM8Bit
//        Timer1.prescalor = .sixtyFour
//        Timer1.CompareOutputModeA = .clear
//        Timer1.outputCompareRegisterA = UInt16(value)
//        
//    }
//}

//func blink() {
//    arduinoUno.pin13.set(.high)
//    waitOneSecond()
//    arduinoUno.pin13.set(.low)
//    waitOneSecond()
//}
//
//
//
//func transmit() {
//    write("Hello World! ")
//    waitOneSecond()
//}
//
//func adcStarded() -> Bool {
//    return AnalogeDigitalConverter.ControlAndStatusRegisterA & Timer1.timerCounterControlRegisterA != 0
//}
//
////func startupAdc() {
////    AnalogeDigitalConverter.enableADC = true
////    AnalogeDigitalConverter.prescalerSelectBits = .Factor128
////    AnalogeDigitalConverter.voltageReferenceSelection = .AVccWithExternalCapacitorAtAnalogReferencePin
////
////    delayMilliSeconds(ms: 10)
////}
//
//func analogRead(pin: UInt8) -> UInt16 {
//    
//    if(pin>7){
//        return 0
//    }
//    
//    if(!adcStarded()){
//        startupAdc()
//    }
//    
//    AnalogeDigitalConverter.MultiplexerSelectionRegister = (pin & 7) 
//    
//    AnalogeDigitalConverter.startConversion = true
//    //AnalogeDigitalConverter.ControlAndStatusRegisterA |= 1 << UInt8(AnalogeDigitalConverter.startConversion);
//    
//    while(AnalogeDigitalConverter.startConversion){}
//    
//    return AnalogeDigitalConverter.DataRegister
//}
//
//// Note: The code inside of this function needs to be added to the run loop. 
//// This does not work inside of this function, it is placed here only as a snippit. 
//func recieve() {
//    while rxBufferAvailable() {
//        if let c = rxBufferRead() {
//            write(c)
//        }
//    }
//}

