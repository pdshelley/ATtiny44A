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

    enum PortA: Port {

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

    enum PortB: Port {

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

    enum PortC: Port {

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

    enum PortD: Port {

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

    enum PortE: Port {

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

    enum PortF: Port {

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

    enum PortG: Port {

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

    enum PortH: Port {

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

    enum PortJ: Port {

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

    enum PortK: Port {

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

    enum PortL: Port {

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
    
    typealias pa0 = DigitalPin<PortA,Bit0>
    typealias pa1 = DigitalPin<PortA,Bit1>
    typealias pa2 = DigitalPin<PortA,Bit2>
    typealias pa3 = DigitalPin<PortA,Bit3>
    typealias pa4 = DigitalPin<PortA,Bit4>
    typealias pa5 = DigitalPin<PortA,Bit5>
    typealias pa6 = DigitalPin<PortA,Bit5>
    typealias pa7 = DigitalPin<PortA,Bit5>
    
    typealias pb0 = DigitalPin<PortB,Bit0>
    typealias pb1 = DigitalPin<PortB,Bit1>
    typealias pb2 = DigitalPin<PortB,Bit2>
    typealias pb3 = DigitalPin<PortB,Bit3>
    typealias pb4 = DigitalPin<PortB,Bit4>
    typealias pb5 = DigitalPin<PortB,Bit5>
    typealias pb6 = DigitalPin<PortB,Bit5>
    typealias pb7 = DigitalPin<PortB,Bit5>
    
    typealias pc0 = DigitalPin<PortC,Bit0>
    typealias pc1 = DigitalPin<PortC,Bit1>
    typealias pc2 = DigitalPin<PortC,Bit2>
    typealias pc3 = DigitalPin<PortC,Bit3>
    typealias pc4 = DigitalPin<PortC,Bit4>
    typealias pc5 = DigitalPin<PortC,Bit5>
    typealias pc6 = DigitalPin<PortC,Bit5>
    typealias pc7 = DigitalPin<PortC,Bit5>
    
    typealias pd0 = DigitalPin<PortD,Bit0>
    typealias pd1 = DigitalPin<PortD,Bit1>
    typealias pd2 = DigitalPin<PortD,Bit2>
    typealias pd3 = DigitalPin<PortD,Bit3>
    typealias pd4 = DigitalPin<PortD,Bit4>
    typealias pd5 = DigitalPin<PortD,Bit5>
    typealias pd6 = DigitalPin<PortD,Bit5>
    typealias pd7 = DigitalPin<PortD,Bit5>
    
    typealias pe0 = DigitalPin<PortE,Bit0>
    typealias pe1 = DigitalPin<PortE,Bit1>
    typealias pe2 = DigitalPin<PortE,Bit2>
    typealias pe3 = DigitalPin<PortE,Bit3>
    typealias pe4 = DigitalPin<PortE,Bit4>
    typealias pe5 = DigitalPin<PortE,Bit5>
    typealias pe6 = DigitalPin<PortE,Bit5>
    typealias pe7 = DigitalPin<PortE,Bit5>
    
    typealias pf0 = DigitalPin<PortF,Bit0>
    typealias pf1 = DigitalPin<PortF,Bit1>
    typealias pf2 = DigitalPin<PortF,Bit2>
    typealias pf3 = DigitalPin<PortF,Bit3>
    typealias pf4 = DigitalPin<PortF,Bit4>
    typealias pf5 = DigitalPin<PortF,Bit5>
    typealias pf6 = DigitalPin<PortF,Bit5>
    typealias pf7 = DigitalPin<PortF,Bit5>
    
    typealias pg0 = DigitalPin<PortG,Bit0>
    typealias pg1 = DigitalPin<PortG,Bit1>
    typealias pg2 = DigitalPin<PortG,Bit2>
    typealias pg3 = DigitalPin<PortG,Bit3>
    typealias pg4 = DigitalPin<PortG,Bit4>
    typealias pg5 = DigitalPin<PortG,Bit5>
    typealias pg6 = DigitalPin<PortG,Bit5>
    typealias pg7 = DigitalPin<PortG,Bit5>
    
    typealias ph0 = DigitalPin<PortH,Bit0>
    typealias ph1 = DigitalPin<PortH,Bit1>
    typealias ph2 = DigitalPin<PortH,Bit2>
    typealias ph3 = DigitalPin<PortH,Bit3>
    typealias ph4 = DigitalPin<PortH,Bit4>
    typealias ph5 = DigitalPin<PortH,Bit5>
    typealias ph6 = DigitalPin<PortH,Bit5>
    typealias ph7 = DigitalPin<PortH,Bit5>
    
    typealias pj0 = DigitalPin<PortJ,Bit0>
    typealias pj1 = DigitalPin<PortJ,Bit1>
    typealias pj2 = DigitalPin<PortJ,Bit2>
    typealias pj3 = DigitalPin<PortJ,Bit3>
    typealias pj4 = DigitalPin<PortJ,Bit4>
    typealias pj5 = DigitalPin<PortJ,Bit5>
    typealias pj6 = DigitalPin<PortJ,Bit5>
    typealias pj7 = DigitalPin<PortJ,Bit5>
    
    typealias pk0 = DigitalPin<PortK,Bit0>
    typealias pk1 = DigitalPin<PortK,Bit1>
    typealias pk2 = DigitalPin<PortK,Bit2>
    typealias pk3 = DigitalPin<PortK,Bit3>
    typealias pk4 = DigitalPin<PortK,Bit4>
    typealias pk5 = DigitalPin<PortK,Bit5>
    typealias pk6 = DigitalPin<PortK,Bit5>
    typealias pk7 = DigitalPin<PortK,Bit5>
    
    typealias pl0 = DigitalPin<PortL,Bit0>
    typealias pl1 = DigitalPin<PortL,Bit1>
    typealias pl2 = DigitalPin<PortL,Bit2>
    typealias pl3 = DigitalPin<PortL,Bit3>
    typealias pl4 = DigitalPin<PortL,Bit4>
    typealias pl5 = DigitalPin<PortL,Bit5>
    typealias pl6 = DigitalPin<PortL,Bit5>
    typealias pl7 = DigitalPin<PortL,Bit5>
}




