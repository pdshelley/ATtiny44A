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
struct GPIO { // TODO: I think I want to rename this struct to AVR5 or something similar. This will probably be the HAL layer for the avr5 core and I'll make a wrapper with a common HAL API that wraps this.

    enum PORTA: Port {

        /// AKA: PORTA. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTA for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x22) } set { _rawPointerWrite(address: 0x22, value: newValue) } }

        /// AKA: DDRA. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x21) } set { _rawPointerWrite(address: 0x21, value: newValue) } }

        /// AKA: PINA. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x20) } set { _rawPointerWrite(address: 0x20, value: newValue) } }
    }

    enum PORTB: Port {

        /// AKA: PORTB. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTB for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x25) } set { _rawPointerWrite(address: 0x25, value: newValue) } }

        /// AKA: DDRB. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x24) } set { _rawPointerWrite(address: 0x24, value: newValue) } }

        /// AKA: PINB. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x23) } set { _rawPointerWrite(address: 0x23, value: newValue) } }
    }

    enum PORTC: Port {

        /// AKA: PORTC. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTC for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x28) } set { _rawPointerWrite(address: 0x28, value: newValue) } }

        /// AKA: DDRC. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x27) } set { _rawPointerWrite(address: 0x27, value: newValue) } }

        /// AKA: PINC. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x26) } set { _rawPointerWrite(address: 0x26, value: newValue) } }
    }

    enum PORTD: Port {

        /// AKA: PORTD. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTD for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x2B) } set { _rawPointerWrite(address: 0x2B, value: newValue) } }

        /// AKA: DDRD. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x2A) } set { _rawPointerWrite(address: 0x2A, value: newValue) } }

        /// AKA: PIND. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x29) } set { _rawPointerWrite(address: 0x29, value: newValue) } }
    }

    enum PORTE: Port {

        /// AKA: PORTE. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTE for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x2E) } set { _rawPointerWrite(address: 0x2E, value: newValue) } }

        /// AKA: DDRE. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x2D) } set { _rawPointerWrite(address: 0x2D, value: newValue) } }

        /// AKA: PINE. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x2C) } set { _rawPointerWrite(address: 0x2C, value: newValue) } }
    }

    enum PORTF: Port {

        /// AKA: PORTF. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTF for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x31) } set { _rawPointerWrite(address: 0x31, value: newValue) } }

        /// AKA: DDRF. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x30) } set { _rawPointerWrite(address: 0x30, value: newValue) } }

        /// AKA: PINF. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x2F) } set { _rawPointerWrite(address: 0x2F, value: newValue) } }
    }

    enum PORTG: Port {

        /// AKA: PORTG. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTG for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x34) } set { _rawPointerWrite(address: 0x34, value: newValue) } }

        /// AKA: DDRG. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x33) } set { _rawPointerWrite(address: 0x33, value: newValue) } }

        /// AKA: PING. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x32) } set { _rawPointerWrite(address: 0x32, value: newValue) } }
    }

    enum PORTH: Port {

        /// AKA: PORTH. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTH for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x102) } set { _rawPointerWrite(address: 0x102, value: newValue) } }

        /// AKA: DDRH. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x101) } set { _rawPointerWrite(address: 0x101, value: newValue) } }

        /// AKA: PINH. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x100) } set { _rawPointerWrite(address: 0x100, value: newValue) } }
    }

    enum PORTJ: Port {

        /// AKA: PORTJ. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTJ for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x105) } set { _rawPointerWrite(address: 0x105, value: newValue) } }

        /// AKA: DDRJ. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x104) } set { _rawPointerWrite(address: 0x104, value: newValue) } }

        /// AKA: PINJ. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x103) } set { _rawPointerWrite(address: 0x103, value: newValue) } }
    }

    enum PORTK: Port {

        /// AKA: PORTK. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTK for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x108) } set { _rawPointerWrite(address: 0x108, value: newValue) } }

        /// AKA: DDRK. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x107) } set { _rawPointerWrite(address: 0x107, value: newValue) } }

        /// AKA: PINK. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x106) } set { _rawPointerWrite(address: 0x106, value: newValue) } }
    }

    enum PORTL: Port {

        /// AKA: PORTL. See ATMega328p Datasheet section 14.4.2. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        // Note: Should we make an alias for this named PORTL for people that want to have "Direct Access" to ports? This is more important for registers that are used for
        // multiple things but could maintain naming consistancy.
        @inlinable
        @inline(__always)
        static var dataRegister: UInt8 { get { _rawPointerRead(address: 0x10B) } set { _rawPointerWrite(address: 0x10B, value: newValue) } }

        /// AKA: DDRL. See ATMega328p Datasheet section 14.4.3. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var dataDirection: UInt8 { get { _rawPointerRead(address: 0x10A) } set { _rawPointerWrite(address: 0x10A, value: newValue) } }

        /// AKA: PINL. See ATMega328p Datasheet section 14.4.4. // TODO: How should we make the Datasheet refrence more generic? Include more of this documentation directly in the code?
        @inlinable
        @inline(__always)
        static var inputAddress: UInt8 { get { _rawPointerRead(address: 0x109) } set { _rawPointerWrite(address: 0x109, value: newValue) } }
    }

    /// PortA
    typealias pa0 = DigitalPin<PORTA,Bit0>
    typealias pa1 = DigitalPin<PORTA,Bit1>
    typealias pa2 = DigitalPin<PORTA,Bit2>
    typealias pa3 = DigitalPin<PORTA,Bit3>
    typealias pa4 = DigitalPin<PORTA,Bit4>
    typealias pa5 = DigitalPin<PORTA,Bit5>
    typealias pa6 = DigitalPin<PORTA,Bit6>
    typealias pa7 = DigitalPin<PORTA,Bit7>

    /// PortB
    typealias pb0 = DigitalPin<PORTB,Bit0>
    typealias pb1 = DigitalPin<PORTB,Bit1>
    typealias pb2 = DigitalPin<PORTB,Bit2>
    typealias pb3 = DigitalPin<PORTB,Bit3>
    typealias pb4 = DigitalPin<PORTB,Bit4>
    typealias pb5 = DigitalPin<PORTB,Bit5>
    typealias pb6 = DigitalPin<PORTB,Bit6>
    typealias pb7 = DigitalPin<PORTB,Bit7>

    /// PortC
    typealias pc0 = DigitalPin<PORTC,Bit0>
    typealias pc1 = DigitalPin<PORTC,Bit1>
    typealias pc2 = DigitalPin<PORTC,Bit2>
    typealias pc3 = DigitalPin<PORTC,Bit3>
    typealias pc4 = DigitalPin<PORTC,Bit4>
    typealias pc5 = DigitalPin<PORTC,Bit5>
    typealias pc6 = DigitalPin<PORTC,Bit6>
    typealias pc7 = DigitalPin<PORTC,Bit7>

    /// PortD
    typealias pd0 = DigitalPin<PORTD,Bit0>
    typealias pd1 = DigitalPin<PORTD,Bit1>
    typealias pd2 = DigitalPin<PORTD,Bit2>
    typealias pd3 = DigitalPin<PORTD,Bit3>
    typealias pd4 = DigitalPin<PORTD,Bit4>
    typealias pd5 = DigitalPin<PORTD,Bit5>
    typealias pd6 = DigitalPin<PORTD,Bit6>
    typealias pd7 = DigitalPin<PORTD,Bit7>

    /// PortE
    typealias pe0 = DigitalPin<PORTE,Bit0>
    typealias pe1 = DigitalPin<PORTE,Bit1>
    typealias pe2 = DigitalPin<PORTE,Bit2>
    typealias pe3 = DigitalPin<PORTE,Bit3>
    typealias pe4 = DigitalPin<PORTE,Bit4>
    typealias pe5 = DigitalPin<PORTE,Bit5>
    typealias pe6 = DigitalPin<PORTE,Bit6>
    typealias pe7 = DigitalPin<PORTE,Bit7>

    /// PortF
    typealias pf0 = DigitalPin<PORTF,Bit0>
    typealias pf1 = DigitalPin<PORTF,Bit1>
    typealias pf2 = DigitalPin<PORTF,Bit2>
    typealias pf3 = DigitalPin<PORTF,Bit3>
    typealias pf4 = DigitalPin<PORTF,Bit4>
    typealias pf5 = DigitalPin<PORTF,Bit5>
    typealias pf6 = DigitalPin<PORTF,Bit6>
    typealias pf7 = DigitalPin<PORTF,Bit7>

    /// PortG
    typealias pg0 = DigitalPin<PORTG,Bit0>
    typealias pg1 = DigitalPin<PORTG,Bit1>
    typealias pg2 = DigitalPin<PORTG,Bit2>
    typealias pg3 = DigitalPin<PORTG,Bit3>
    typealias pg4 = DigitalPin<PORTG,Bit4>
    typealias pg5 = DigitalPin<PORTG,Bit5>
    typealias pg6 = DigitalPin<PORTG,Bit6>
    typealias pg7 = DigitalPin<PORTG,Bit7>

    /// PortH
    typealias ph0 = DigitalPin<PORTH,Bit0>
    typealias ph1 = DigitalPin<PORTH,Bit1>
    typealias ph2 = DigitalPin<PORTH,Bit2>
    typealias ph3 = DigitalPin<PORTH,Bit3>
    typealias ph4 = DigitalPin<PORTH,Bit4>
    typealias ph5 = DigitalPin<PORTH,Bit5>
    typealias ph6 = DigitalPin<PORTH,Bit6>
    typealias ph7 = DigitalPin<PORTH,Bit7>

    /// PortJ
    typealias pj0 = DigitalPin<PORTJ,Bit0>
    typealias pj1 = DigitalPin<PORTJ,Bit1>
    typealias pj2 = DigitalPin<PORTJ,Bit2>
    typealias pj3 = DigitalPin<PORTJ,Bit3>
    typealias pj4 = DigitalPin<PORTJ,Bit4>
    typealias pj5 = DigitalPin<PORTJ,Bit5>
    typealias pj6 = DigitalPin<PORTJ,Bit6>
    typealias pj7 = DigitalPin<PORTJ,Bit7>

    /// PortK
    typealias pk0 = DigitalPin<PORTK,Bit0>
    typealias pk1 = DigitalPin<PORTK,Bit1>
    typealias pk2 = DigitalPin<PORTK,Bit2>
    typealias pk3 = DigitalPin<PORTK,Bit3>
    typealias pk4 = DigitalPin<PORTK,Bit4>
    typealias pk5 = DigitalPin<PORTK,Bit5>
    typealias pk6 = DigitalPin<PORTK,Bit6>
    typealias pk7 = DigitalPin<PORTK,Bit7>

    /// PortL
    typealias pl0 = DigitalPin<PORTL,Bit0>
    typealias pl1 = DigitalPin<PORTL,Bit1>
    typealias pl2 = DigitalPin<PORTL,Bit2>
    typealias pl3 = DigitalPin<PORTL,Bit3>
    typealias pl4 = DigitalPin<PORTL,Bit4>
    typealias pl5 = DigitalPin<PORTL,Bit5>
    typealias pl6 = DigitalPin<PORTL,Bit6>
    typealias pl7 = DigitalPin<PORTL,Bit7>


}




