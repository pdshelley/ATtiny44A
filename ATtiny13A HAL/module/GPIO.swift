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
    
    enum PORTB: Port {

        /// AKA: PORTB. See ATtiny13A Datasheet section 10.4.2.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x18) } set { _rawPointerWrite(address: 0x18, value: newValue) } }

        /// AKA: DDRB. See ATtiny13A Datasheet section 10.4.3.
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x17) } set { _rawPointerWrite(address: 0x17, value: newValue) } }

        /// AKA: PINB. See ATtiny13A Datasheet section 10.4.4.
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x16) } set { _rawPointerWrite(address: 0x16, value: newValue) } }
    }
}




