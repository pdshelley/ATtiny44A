//===----------------------------------------------------------------------===//
//
// Timers.swift
// Swift For Arduino
//
// Created by Paul Shelley on 12/31/2022.
// Copyright © 2022 Paul Shelley. All rights reserved.
//
//===----------------------------------------------------------------------===//
//===----------------------------------------------------------------------===//
// Timers
//===----------------------------------------------------------------------===//



typealias timer0 = AVRTimer0


// TODO: Section 12.4.1 in the ATtiny13A datasheet: GTCCR – General Timer/Counter Control Register

// NOTE: PRTIM2 needs to be written to zero to enable Timer/Counter2 module. See Datasheet section 18.2 // This was true for the ATmega328p, but probably applies to the ATtiny13A. Double check this.
struct Timer0 {
    
    /// 11.9.1 TCCR0A – Timer/Counter Control Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x2F)       | COM0A1| COM0A0| COM0B1| COM0B0|   -   |   -   | WGM01 | WGM00
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |   R   |   R   |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var timerCounterControlRegisterA: UInt8 {
        get {
            _rawPointerRead(address: 0x2F)
        }
        set {
            _rawPointerWrite(address: 0x2F, value: newValue)
        }
    }
    
    
    /// 11.9.2 TCCR0B – Timer/Counter Control Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x33)       | FOC0A | FOC0B |   -   |   -   | WGM02 | CS02  | CS01  | CS00  |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |   R   |   R   |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var timerCounterControlRegisterB: UInt8 {
        get {
            _rawPointerRead(address: 0x33)
        }
        set {
            _rawPointerWrite(address: 0x33, value: newValue)
        }
    }
    
    
    /// 11.9.3 TCNT0 – Timer/Counter Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x32)       |                         TCNT0                                 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the TCNT2 is used for. I think this is just the actual timer counter that is incrimented each tick of the timer.
    // TODO: Decide about simplifying this with TCNT2
    @inlinable
    @inline(__always)
    static var timerCounterNumber: UInt8 {
        get {
            return _rawPointerRead(address: 0x32)
        }
        set {
            _rawPointerWrite(address: 0x32, value: newValue)
        }
    }
    
    
    /// 11.9.4 OCR0A – Output Compare Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x36)       |                         OCR0A                                 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // TODO: I believe OCR2A always needs to be larger than OCR2B. Should we have a safety for this?
    // TODO: Decide about simplifying this with OCR2A
    @inlinable
    @inline(__always)
    static var outputCompareRegisterA: UInt8 {
        get {
            return _rawPointerRead(address: 0x36)
        }
        set {
            _rawPointerWrite(address: 0x36, value: newValue)
        }
    }
    
    
    /// 11.9.5 OCR2B – Output Compare Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x29)       |                         OCR0B                                 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // TODO: I believe OCR2A always needs to be larger than OCR2B. Should we have a safety for this?
    // TODO: Decide about simplifying this with OCR2B
    @inlinable
    @inline(__always)
    static var outputCompareRegisterB: UInt8 {
        get {
            return _rawPointerRead(address: 0x29)
        }
        set {
            _rawPointerWrite(address: 0x29, value: newValue)
        }
    }
    
    
    /// 11.9.6 TIMSK0 – Timer/Counter2 Interrupt Mask Register
    /// Note: the positions of OCIE0B, OCIE0A, and TOIE0 are different than the 328P.
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x39)       |   -   |   -   |   -   |   -   | OCIE0B| OCIE0A| TOIE0 |   -   |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |   R   |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the TIMSK2 (Timer Interrupt Mask Register) is used for.
    // TODO: Decide about simplifying this with TIMSK2
    @inlinable
    @inline(__always)
    static var timerInterruptMaskRegister: UInt8 {
        get {
            return _rawPointerRead(address: 0x39)
        }
        set {
            _rawPointerWrite(address: 0x39, value: newValue)
        }
    }
    
    
    /// 11.9.7 TIFR0 – Timer/Counter2 Interrupt Flag Register
    /// Note: the positions of OCF0B, OCF0A, and TOV0 are different than the 328P.
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x38)       |   -   |   -   |   -   |   -   | OCF0B | OCF0A | TOV0  |   -   |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |   -   |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the TIFR2 (Timer Interrupt Flag Register) is used for.
    // TODO: Decide about simplifying this with TIFR2
    @inlinable
    @inline(__always)
    static var timerInterruptFlagRegister: UInt8 {
        get {
            return _rawPointerRead(address: 0x38)
        }
        set {
            _rawPointerWrite(address: 0x38, value: newValue)
        }
    }
}


/// Extension for Wave Form Generation Mode enumerations
extension Timer0 {
    
    // TODO: I've added notes from the datasheet that show the differences between all the modes for timers 0 and 2 which are 8 bit. This needs to be abstracted in some way and made safe.
    enum CompareOutputModeOption: UInt8 {
        // For A&B non-PWM Mode:           Normal port operation, Output Compare Pin disconnected. See Tables 15-2, 15-5, 18-2, or Table 18-5.
        // For A&B Fast PWM Mode:          Normal port operation, Output Compare Pin disconnected. See Tables 18-3 or Table 18-6.
        // For A&B Phase Correct PWM Mode: Normal port operation, Output Compare Pin disconnected. See Tables 18-4 or Table 18-7.
        // Note: Output Compare Pin is OC + TimerNumber + PinLetter. Ex: Timer 0 pin A would be OC0A while Timer 2 pin B would be OC2B.
        case normal = 0
        
        // For A non-PWM Mode:           Toggle Output Compare Pin on Compare Match. See Tables 15-2, 15-5, 18-2, or Table 18-5.
        // For A Fast PWM Mode:          WGM02 = 0: Normal Port Operation, OC0A Disconnected. WGM02 = 1: Toggle OC0A on Compare Match. See Table 15-3.
        // For A Phase Correct PWM Mode: WGM02 = 0: Normal Port Operation, OC0A Disconnected. WGM02 = 1: Toggle OC0A on Compare Match. See Table 15-4.
        // For B non-PWM Mode:           Toggle Output Compare Pin on Compare Match. See Table 15-5.
        // For B Fast PWM Mode:          Reserved. See Table 15-6
        // For B Phase Correct PWM Mode: Reserved. See Table 15-7
        // NOTE: A special case occurs when OCR0A equals TOP and COM0A1 is set. In this case, the Compare Match is ignored, but the set or clear is done at BOTTOM. See ”Fast PWM Mode” on page 108 for more details.
        // NOTE: A special case occurs when OCR0A equals TOP and COM0A1 is set. In this case, the Compare Match is ignored, but the set or clear is done at TOP. See ”Phase Correct PWM Mode” on page 134 for more details.
        // NOTE: B special case occurs when OCR0B equals TOP and COM0B1 is set. In this case, the Compare Match is ignored, but the set or clear is done at TOP. See ”Fast PWM Mode” on page 108 for more details.
        // NOTE: B special case occurs when OCR0B equals TOP and COM0B1 is set. In this case, the Compare Match is ignored, but the set or clear is done at TOP*. See ”Phase Correct PWM Mode” on page 109 for more details. // * I believe there is an error here in the datasheet as it should say BOTTOM
        case toggle = 1 // TODO: Sometimes this is Reserved and does not work with some Waveform Generation Modes
        
        // For A non-PWM Mode:           Clear Output Compare Pin on Compare Match. See Table 15-2
        // For A Fast PWM Mode:          Clear OC0A on Compare Match, set OC0A at BOTTOM, (non-inverting mode).
        // For A Phase Correct PWM Mode: Clear OC0A on Compare Match when up-counting. Set OC0A on Compare Match when down-counting.
        // For B non-PWM Mode:           Clear OC0B on Compare Match
        // For B Fast PWM Mode:          Clear OC0B on Compare Match, set OC0B at BOTTOM, (non-inverting mode)
        // For B Phase Correct PWM Mode: Clear OC0B on Compare Match when up-counting. Set OC0B on Compare Match when down-counting.
        // NOTE:
        case clear = 2
        
        // For A&B non-PWM Mode:           Set Output Compare Pin on Compare Match
        // For A&B Fast PWM Mode:          Set Output Compare Pin on Compare Match, clear Output Compare Pin at BOTTOM, (inverting mode).
        // For A&B Phase Correct PWM Mode: Set Output Compare Pin on Compare Match when up-counting. Clear Output Compare Pin on Compare Match when down-counting.
        // NOTE: Output Compare Pin is OC + TimerNumber + PinLetter. Ex: Timer 0 pin A would be OC0A while Timer 2 pin B would be OC2B.
        case set = 3
    }
    
    /// See ATtiny13A Datasheet Table 11-8.
    /// NOTE: Modes #4 and #5 are Reserved and are unavalible for use and thus not included.
    /// Note: This works for the 8 bit timers but the 16 bit timer has different Waveform Generation Modes.
    ///
    /// Table 11-8. Waveform Generation Mode Bit Description
    ///
    //---------------------------------------------------------------------------------------------------
    //  Mode  | WGM02 | WGM01 | WGM00 | Mode of Operation  |  TOP  | Update of OCRx at | TOV Flag Set on |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | Normal             | 0xFF  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | PWM, Phase Correct | 0xFF  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | CTC                | OCRA  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | Fast PWM           | 0xFF  | BOTTOM            | MAX             | // Datasheet says top for Update of OCRx. Seems like a mistake.
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | PWM, Phase Correct | OCRA  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | Fast PWM           | OCRA  | BOTTOM            | TOP             | // Datasheet says top for Update of OCRx. Seems like a mistake.
    //---------------------------------------------------------------------------------------------------
    // Notes: 1. MAX= 0xFF
    //        2. BOTTOM= 0x00
    //
    enum WaveformGenerationModeOption: UInt8 {
        case normal = 0
        case phaseCorrectPWM = 1
        case clearTimerOnCompareMatch = 2
        case fastPWM = 3
        
        // Note: The difference in Modes 5 and 7 are that the Output Compare Register (OCRA or OCRB) is the "Top" where in modes 1 and 3, 255 (0xFF) is the "Top".
        case advancedPhaseCorrectPWM = 5 // TODO: What should this be called?
        case advancedFastPWM = 7  // TODO: What should this be called?
    }
    
    /// See ATtiny13A Datasheet Table 11-9.
    ///
    /// Table 11-9. Clock Select Bit Description
    //
    //---------------------------------------------------------------------------------------------------
    //  Mode  | CS02  | CS01  | CS00  | Description                                                     |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | No clock source (Timer/Counter stopped)                         |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | clk (No prescaling)                                             |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | clk /8 (From prescaler)                                         |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | clk /64 (From prescaler)                                        |
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | clkI/O/256 (From prescaler)                                     |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | clkI/O/1024 (From prescaler)                                    |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | External clock source on T0 pin. Clock on falling edge.         |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | External clock source on T0 pin. Clock on rising edge.          |
    //---------------------------------------------------------------------------------------------------
    /// If external pin modes are used for the Timer/Counter0, transitions on the T0 pin will clock the counter even if the pin is configured as an output. This feature allows software control of the counting.
    ///
    enum Prescaling: UInt8 {
        case noClockSource = 0
        case none = 1
        case eight = 2
        case sixtyFour = 3
        case twoFiftySix = 4
        case tenTwentyFour = 5
        case externalClockOnFallingEdge = 6
        case externalClockOnRisingEdge = 7
    }
    
}

// TODO: The position of these bits are in a different place and need updating. This won't work in it's current state.
/// Extension for Wave Form Generation Mode settings
extension AVRTimer0 {
    // TODO: Missing Force Output Compare A and B.
    
    // NOTE: There are many uses for PWM, some as simple as holding the same pulse width and only changing periodically for hobby servo control or LED brightness,
    // while more advanced uses can use the timer interupt to dynamically change the pulse width to output complex wave forms.
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
    /// Compare Match Output A Mode
    /// AKA: COM0A. See ATtiny13A Datasheet 11.9.1 Bits 7 & 6.
    ///
    /// These bits control the Output Compare pin (OC0A) behavior. If one or both of the COM0A[1:0] bits are set, the OC0A output overrides the normal port functionality of the I/O pin it is connected to. However, note that the
    /// Data Direction Register (DDR) bit corresponding to the OC0A pin must be set in order to enable the output driver.
    ///
    /// When OC0A is connected to the pin, the function of the COM0A[1:0] bits depends on the WGM0[2:0] bit setting.
    @inlinable
    @inline(__always)
    static var CompareOutputModeA: Timers.CompareOutputModeOption {
        get {
            let mode = (timerCounterControlRegisterA & 0b11000000) >> UInt8(6)
            return Timers.CompareOutputModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            timerCounterControlRegisterA |= (newValue.rawValue & 0b00000011) << UInt8(6)
        }
    }
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
    /// Compare Match Output B Mode
    /// AKA: COM0B. See ATtiny13A Datasheet 11.9.1 Bits 5 & 4
    ///
    /// These bits control the Output Compare pin (OC0B) behavior. If one or both of the COM0B[1:0] bits are set, the OC0B output overrides the normal port functionality of the I/O pin it is connected to. However, note that the
    /// Data Direction Register (DDR) bit corresponding to the OC0B pin must be set in order to enable the output driver.
    ///
    /// When OC0B is connected to the pin, the function of the COM0B[1:0] bits depends on the WGM0[2:0] bit setting.
    @inlinable
    @inline(__always)
    static var CompareOutputModeB: Timers.CompareOutputModeOption {
        get {
            let mode = (timerCounterControlRegisterA & 0b00110000) >> 4
            return Timers.CompareOutputModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            timerCounterControlRegisterA |= (newValue.rawValue & 0b00000011) << UInt8(4)
        }
    }
    
    
    /// See ATtiny13A Datasheet Table 11-9.
    ///
    /// Table 11-9. Clock Select Bit Description
    //
    //---------------------------------------------------------------------------------------------------
    //  Mode  | CS02  | CS01  | CS00  | Description                                                     |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | No clock source (Timer/Counter stopped)                         |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | clk (No prescaling)                                             |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | clk /8 (From prescaler)                                         |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | clk /64 (From prescaler)                                        |
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | clkI/O/256 (From prescaler)                                     |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | clkI/O/1024 (From prescaler)                                    |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | External clock source on T0 pin. Clock on falling edge.         |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | External clock source on T0 pin. Clock on rising edge.          |
    //---------------------------------------------------------------------------------------------------
    /// If external pin modes are used for the Timer/Counter0, transitions on the T0 pin will clock the counter even if the pin is configured as an output. This feature allows software control of the counting.
    ///
    @inlinable
    @inline(__always)
    static var prescalor: Timers.Prescaling {
        get {
            let mode = timerCounterControlRegisterA & 0b00000111
            return Timers.Prescaling.init(rawValue: mode) ?? .noClockSource
        }
        set {
            timerCounterControlRegisterB |= newValue.rawValue & 0b00000111
        }
    }
    
    
    /// See ATtiny13A Datasheet Table 11-8.
    /// NOTE: Modes #4 and #5 are Reserved and are unavalible for use and thus not included.
    ///
    /// Combined with the WGM02 bit found in the TCCR0B Register, these bits control the counting sequence of the counter, the source for maximum (TOP) counter value, and what type of wave- form generation to be used,
    /// see Table 11-8 on page 79. Modes of operation supported by the Timer/Counter unit are: Normal mode (counter), Clear Timer on Compare Match (CTC) mode, and two types of Pulse Width Modulation (PWM) modes
    /// (see “Modes of Operation” on page 70).
    ///
    /// Table 11-8. Waveform Generation Mode Bit Description
    ///
    //---------------------------------------------------------------------------------------------------
    //  Mode  | WGM02 | WGM01 | WGM00 | Mode of Operation  |  TOP  | Update of OCRx at | TOV Flag Set on |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | Normal             | 0xFF  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | PWM, Phase Correct | 0xFF  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | CTC                | OCRA  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | Fast PWM           | 0xFF  | BOTTOM            | MAX             | // Datasheet says top for Update of OCRx. Seems like a mistake.
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | PWM, Phase Correct | OCRA  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | Fast PWM           | OCRA  | BOTTOM            | TOP             | // Datasheet says top for Update of OCRx. Seems like a mistake.
    //---------------------------------------------------------------------------------------------------
    // Notes: 1. MAX= 0xFF
    //        2. BOTTOM= 0x00
    //
    @inlinable
    @inline(__always)
    static var waveformGenerationMode: Timers.WaveformGenerationModeOption {
        get {
            let mode = ((timerCounterControlRegisterB & 0b00001000) >> 1) | (timerCounterControlRegisterA & 0b00000011)
            return Timers.WaveformGenerationModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            timerCounterControlRegisterA |= (newValue.rawValue & 0b00000011)
            timerCounterControlRegisterB |= ((newValue.rawValue & 0b00000100) << UInt8(1))
        }
    }
    
    /// Timer/Counter Output Compare Match B Interrupt Enabled
    /// AKA: OCIE0B. See ATtiny13A Datasheet 11.9.6 bit 3.
    ///
    /// When the OCIE0B bit is written to one, and the I-bit in the Status Register is set, the Timer/Counter Compare Match B interrupt is enabled. The corresponding interrupt is executed if a Compare Match in Timer/Counter occurs,
    /// i.e., when the OCF0B bit is set in the Timer/Counter Interrupt Flag Register – TIFR0.
    @inlinable
    @inline(never) // TODO: In the UART code this needed to be 'never', we need to determine what the cause of this is, related to using a Bool here or was it specific to UART.
    static var outputCompareMatchBInterruptEnabled: Bool {
        get {
            return !((timerInterruptMaskRegister & 0b00001000) == 0)
        }
        set {
            timerInterruptMaskRegister |= UInt8(newValue.hashValue) & 0b00001000
        }
    }
    
    /// Timer/Counter Output Compare Match A Interrupt Enabled
    /// AKA: OCIE0A. See ATtiny13A Datasheet 11.9.6 bit 2.
    ///
    /// When the OCIE0A bit is written to one, and the I-bit in the Status Register is set, the Timer/Counter0 Compare Match A interrupt is enabled. The corresponding interrupt is executed if a Compare Match in Timer/Counter0 occurs,
    /// i.e., when the OCF0A bit is set in the Timer/Counter 0 Interrupt Flag Register – TIFR0.
    @inlinable
    @inline(never) // TODO: In the UART code this needed to be 'never', we need to determine what the cause of this is, related to using a Bool here or was it specific to UART.
    static var outputCompareMatchAInterruptEnabled: Bool {
        get {
            return !((timerInterruptMaskRegister & 0b00000100) == 0)
        }
        set {
            timerInterruptMaskRegister |= UInt8(newValue.hashValue) & 0b00000100
        }
    }
    
    /// Timer/Counter Overflow Interrupt Enabled
    /// AKA: TOIE0. See ATtiny13A Datasheet 11.9.6 bit 1.
    ///
    ///  When the TOIE0 bit is written to one, and the I-bit in the Status Register is set, the Timer/Count- er0 Overflow interrupt is enabled. The corresponding interrupt is executed if an overflow in Timer/Counter0 occurs, i.e., when the
    ///  TOV0 bit is set in the Timer/Counter 0 Interrupt Flag Reg- ister – TIFR0.
    @inlinable
    @inline(never) // TODO: In the UART code this needed to be 'never', we need to determine what the cause of this is, related to using a Bool here or was it specific to UART.
    static var outputCompareMatchAInterruptEnabled: Bool {
        get {
            return !((timerInterruptMaskRegister & 0b00000010) == 0)
        }
        set {
            timerInterruptMaskRegister |= UInt8(newValue.hashValue) & 0b00000010
        }
    }
    
    /// Output Compare Flag B
    /// AKA: OCF0B. See ATtiny13A Datasheet 11.9.7 bit 3.
    ///
    /// The OCF0B bit is set when a Compare Match occurs between the Timer/Counter and the data in OCR0B – Output Compare Register0 B. OCF0B is cleared by hardware when executing the cor- responding interrupt handling vector.
    /// Alternatively, OCF0B is cleared by writing a logic one to the flag. When the I-bit in SREG, OCIE0B (Timer/Counter Compare B Match Interrupt Enable), and OCF0B are set, the Timer/Counter Compare Match Interrupt is executed.
    @inlinable
    @inline(never) // TODO: In the UART code this needed to be 'never', we need to determine what the cause of this is, related to using a Bool here or was it specific to UART.
    static var outputCompareFlagB: Bool {
        get {
            return !((timerInterruptMaskRegister & 0b00001000) == 0)
        }
        set {
            timerInterruptMaskRegister |= UInt8(newValue.hashValue) & 0b00001000
        }
    }
    
    /// Output Compare Flag A
    /// AKA: OCF0A. See ATtiny13A Datasheet 11.9.7 bit 2.
    ///
    /// The OCF0A bit is set when a Compare Match occurs between the Timer/Counter0 and the data in OCR0A – Output Compare Register0. OCF0A is cleared by hardware when executing the cor- responding interrupt handling vector.
    /// Alternatively, OCF0A is cleared by writing a logic one to the flag. When the I-bit in SREG, OCIE0A (Timer/Counter0 Compare Match Interrupt Enable), and OCF0A are set, the Timer/Counter0 Compare Match Interrupt is executed.
    @inlinable
    @inline(never) // TODO: In the UART code this needed to be 'never', we need to determine what the cause of this is, related to using a Bool here or was it specific to UART.
    static var outputCompareFlagB: Bool {
        get {
            return !((timerInterruptMaskRegister & 0b00000100) == 0)
        }
        set {
            timerInterruptMaskRegister |= UInt8(newValue.hashValue) & 0b00000100
        }
    }
    
    /// Timer/Counter Overflow Flag
    /// AKA: TOV0. See ATtiny13A Datasheet 11.9.7 bit 1.
    ///
    /// The bit TOV0 is set when an overflow occurs in Timer/Counter0. TOV0 is cleared by hardware when executing the corresponding interrupt handling vector. Alternatively, TOV0 is cleared by writing a logic one to the flag.
    /// When the SREG I-bit, TOIE0 (Timer/Counter0 Overflow Interrupt Enable), and TOV0 are set, the Timer/Counter0 Overflow interrupt is executed.
    ///
    /// The setting of this flag is dependent of the WGM0[2:0] bit setting. Refer to Table 11-8, “Wave- form Generation Mode Bit Description” on page 79.
    @inlinable
    @inline(never) // TODO: In the UART code this needed to be 'never', we need to determine what the cause of this is, related to using a Bool here or was it specific to UART.
    static var outputCompareFlagB: Bool {
        get {
            return !((timerInterruptMaskRegister & 0b00000100) == 0)
        }
        set {
            timerInterruptMaskRegister |= UInt8(newValue.hashValue) & 0b00000100
        }
    }
}




protocol TimerPort {
    // this will probably(?) always be UInt8, but is useful for preventing the protocol
    // from ever accidentally being used as an existential type
    //    associatedtype PortDataType: BinaryInteger // TODO: Fix this.
    
    static var timerCounterControlRegisterA: UInt8 { get set }
    static var timerCounterControlRegisterB: UInt8 { get set }
    static var timerCounterNumber:  UInt8 { get set }
    static var outputCompareRegisterA:  UInt8 { get set }
    static var outputCompareRegisterA:  UInt8 { get set }
    static var timerInterruptMaskRegister: UInt8 { get set }
    static var timerInterruptFlagRegister:  UInt8 { get set }
}

protocol Timer8Bit, TimerPort {
}

protocol Timer10Bit, TimerPort {
}

protocol Timer16Bit, TimerPort {
}

protocol AsycTimer {
    static var ASSR:   UInt8 { get set }
    static var GTCCR:  UInt8 { get set }
}

protocol PWMTimer {
    // Note: The positions of OCIE0B, OCIE0A, and TOIE0 on the ATtiny13A are different than the 328P.
    // Note: The positions of OCF0B, OCF0A, and TOV0 on the ATtiny13A are different than the 328P.

    
    
    // Note: I believe when there is No External Clock then these are the Prescalors
    enum Prescaling: UInt8 {
        case noClockSource = 0 // No Clock Source - counter is off
        case none = 1 // clkT2S - No Prescaler
        case eight = 2 // clkT2S/8
        case thirtyTwo = 3 // clkT2S/32
        case sixtyFour = 4 // clkT2S/64
        case oneTwentyEight = 5 // clkT2S/128
        case twoFiftySix = 6 // clkT2S/256
        case tenTwentyFour = 7 // clkT2S/1024
    }
    
    // Note: I believe when there is an External Clock then these are the Prescalors
    enum Prescaling: UInt8 {
        case noClockSource = 0
        case none = 1
        case eight = 2
        case sixtyFour = 3
        case twoFiftySix = 4
        case tenTwentyFour = 5
        case externalClockOnFallingEdge = 6
        case externalClockOnRisingEdge = 7
    }
}




