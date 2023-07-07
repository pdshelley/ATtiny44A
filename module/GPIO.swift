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
/// Note: See ATtiny44A Datasheet section 10.3. 
struct GPOI { 

    enum PORTA: Port {

        /// AKA: PORTA. See ATtiny44A Datasheet section 10.3.2.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x3B) } set { _rawPointerWrite(address: 0x3B, value: newValue) } }

        /// AKA: DDRA. See ATtiny44A Datasheet section 10.3.3. 
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x3A) } set { _rawPointerWrite(address: 0x3A, value: newValue) } }

        /// AKA: PINA. See ATtiny44A Datasheet section 10.3.4. 
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x39) } set { _rawPointerWrite(address: 0x39, value: newValue) } }
    }

    enum PORTB: Port {

        /// AKA: PORTB. See ATtiny44A Datasheet section 10.3.5. 
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x38) } set { _rawPointerWrite(address: 0x38, value: newValue) } }

        /// AKA: DDRB. See ATtiny44A Datasheet section 10.3.6.
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x37) } set { _rawPointerWrite(address: 0x37, value: newValue) } }

        /// AKA: PINB. See ATtiny44A Datasheet section 10.3.7. 
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x36) } set { _rawPointerWrite(address: 0x36, value: newValue) } }
    }
}




