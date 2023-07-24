//===----------------------------------------------------------------------===//
//
// GPIO.swift
// Swift For Arduino
//
// Created by Carl Peto & Paul Shelley on 11/27/20.
// Copyright © 2020 Swift4Arduino. All rights reserved.
//
//===----------------------------------------------------------------------===//



/// GPIO
/// Note:  See ATtiny13A Datasheet section 10.4.
struct GPIO {
    
    enum PortB: Port {

        /// AKA: PORTB. See ATtiny13A Datasheet section 10.4.2.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x38) } set { _rawPointerWrite(address: 0x38, value: newValue) } }

        /// AKA: DDRB. See ATtiny13A Datasheet section 10.4.3.
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x37) } set { _rawPointerWrite(address: 0x37, value: newValue) } }

        /// AKA: PINB. See ATtiny13A Datasheet section 10.4.4.
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x36) } set { _rawPointerWrite(address: 0x36, value: newValue) } }
    }
    
    enum pdip8 {
        typealias pin1 = pb5 // (PCINT5/RESET/ADC0/dW)
        typealias pin2 = pb3 // (PCINT3/CLKI/ADC3)
        typealias pin3 = pb4 // (PCINT4/ADC2)
        // pin4 = GND
        typealias pin5 = pb0 // (MOSI/AIN0/OC0A/PCINT0)
        typealias pin6 = pb1 // (MISO/AIN1/OC0B/INT0/PCINT1)
        typealias pin7 = pb2 // (SCK/ADC1/T0/PCINT2)
        // pin8 = VCC
    }
    
    enum wqfn20 {
        typealias pin1 = pb5 // PCINT5/RESET/ADC0/dW
        typealias pin2 = pb3 // PCINT3/CLKI/ADC3
        // pin3 = pd1
        // pin4 = pd2
        typealias pin5 = pb4 // PCINT4/ADC2
        // pin6 = DNC
        // pin7 = DNC
        // pin8 = GND
        // pin9 = DNC
        // pin10 = DNC
        typealias pin11 = pb0 // MOSI/AIN0/OC0A/PCINT0
        typealias pin12 = pb1 // MISO/AIN1/OC0B/INT0/PCINT1
        // pin13 = DNC
        typealias pin14 = pb2 // SCK/ADC1/T0/PCINT2
        // pin15 = VCC
        // pin16 = DNC
        // pin17 = DNC
        // pin18 = DNC
        // pin19 = DNC
        // pin20 = DNC
    }
    
    enum vdfn10 {
        typealias pin1 = pb5 // PCINT5/RESET/ADC0/dW
        typealias pin2 = pb3 // PCINT3/CLKI/ADC3
        // pin3 = DNC
        typealias pin4 = pb4 // PCINT4/ADC2
        // pin5 = GND
        typealias pin6 = pb0 // MOSI/AIN0/OC0A/PCINT0
        typealias pin7 = pb1 // MISO/AIN1/OC0B/INT0/PCINT1
        // pin8 = DNC
        typealias pin9 = pb2 // SCK/ADC1/T0/PCINT2
        // pin10 = pb7 // VCC
    }
    
    /// See ATtiny13A Datasheet Table 10-3
    typealias pb0 = DigitalPin<PortB,Bit0> // MOSI/AIN0/OC0A/PCINT0
    typealias pb1 = DigitalPin<PortB,Bit1> // MISO/AIN1/OC0B/INT0/PCINT1
    typealias pb2 = DigitalPin<PortB,Bit2> // SCK/ADC1/T0/PCINT2
    typealias pb3 = DigitalPin<PortB,Bit3> // PCINT3/CLKI/ADC3
    typealias pb4 = DigitalPin<PortB,Bit4> // PCINT4/ADC2
    typealias pb5 = DigitalPin<PortB,Bit5> // PCINT5/RESET/ADC0/dW
}




