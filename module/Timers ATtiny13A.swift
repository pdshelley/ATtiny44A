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





// TODO: Timer1 is 16 bit and has quite a few differences. Figure out how to abstract this.
enum Timers {
    
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
    
    /// See ATMega328p Datasheet Table 18-8.
    // NOTE: Modes #4 and #5 are Reserved and are unavalible for use and thus not included.
    // Note: This works for the 8 bit timers but the 16 bit timer has different Waveform Generation Modes.
    //
    /// Table 18-8. Waveform Generation Mode Bit Description
    //
    //---------------------------------------------------------------------------------------------------
    //  Mode  | WGM22 | WGM21 | WGM20 | Mode of Operation  |  TOP  | Update of OCRx at | TOV Flag Set on |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | Normal             | 0xFF  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | PWM, Phase Correct | 0xFF  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | CTC                | OCRA  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | Fast PWM           | 0xFF  | BOTTOM            | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | PWM, Phase Correct | OCRA  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | Fast PWM           | OCRA  | BOTTOM            | TOP             |
    //---------------------------------------------------------------------------------------------------
    //Notes: 1. MAX= 0xFF
    //       2. BOTTOM= 0x00
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
    
    /// See ATMega328p Datasheet Table 18-9.
    // Note: This works for the 8 bit timers but the 16 bit timer has external clock source as an option as well.
    //
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
    
}

enum Timers16Bit {
    
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
    
    /// See ATMega328p Datasheet Table 18-8.
    // NOTE: Modes #4 and #5 are Reserved and are unavalible for use and thus not included.
    // Note: This works for the 8 bit timers but the 16 bit timer has different Waveform Generation Modes.
    //
    /// Table 18-8. Waveform Generation Mode Bit Description
    //
    //---------------------------------------------------------------------------------------------------
    //  Mode  | WGM22 | WGM21 | WGM20 | Mode of Operation  |  TOP  | Update of OCRx at | TOV Flag Set on |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | Normal             | 0xFF  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | PWM, Phase Correct | 0xFF  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | CTC                | OCRA  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | Fast PWM           | 0xFF  | BOTTOM            | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | PWM, Phase Correct | OCRA  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | Fast PWM           | OCRA  | BOTTOM            | TOP             |
    //---------------------------------------------------------------------------------------------------
    //Notes: 1. MAX= 0xFF
    //       2. BOTTOM= 0x00
    //
    
    // 16 bit timer version for ATMega328p Timer 1
    enum WaveformGenerationModeOption: UInt8 {
        case normal = 0
        case phaseCorrectPWM8Bit = 1
        case phaseCorrectPWM9Bit = 2
        case phaseCorrectPWM10Bit = 3
        case clearTimerCountOnOutputCompairRegister = 4 // TODO: I think naming needs to be updated to be similar to this on the 8 bit version.
        case fastPWM8Bit = 5
        case fastPWM9Bit = 6
        case fastPWM10Bit = 7
        case phaseAndFrequencyCorrectPWMOnInputCaptureRegister = 8 // TODO: Update the names of the 8 bit version to be similar to this
        case phaseAndFrequencyCorrectPWMOnOutputCompairRegister = 9
        case phaseCorrectPWMOnInputCaptureRegister = 10
        case phaseCorrectPWMOnOutputCompairRegister = 11
        case clearTimerCountOnInputCaptureRegister = 12
        case fastPWMOnInputCaptureRegister = 14
        case fastPWMOnOutputCompairRegister = 15
    }
    
    
    
//    enum WaveformGenerationModeOption8Bit: UInt8 {
//        case normal = 0
//        case phaseCorrectPWM = 1
//        case clearTimerOnCompareMatch = 2
//        case fastPWM = 3
//
//        // Note: The difference in Modes 5 and 7 are that the Output Compare Register (OCRA or OCRB) is the "Top" where in modes 1 and 3, 255 (0xFF) is the "Top".
//        case advancedPhaseCorrectPWM = 5 // TODO: What should this be called?
//        case advancedFastPWM = 7  // TODO: What should this be called?
//    }
    
    
    
    // 16 bit Prescaling on ATMega328p Timer1
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

// TODO: Make Generic
protocol AVRTimer0 {
    // this will probably(?) always be UInt8, but is useful for preventing the protocol
    // from ever accidentally being used as an existential type
    //    associatedtype PortDataType: BinaryInteger // TODO: Fix this.
    
    static var timerCounterControlRegisterA: UInt8 { get set }
    static var timerCounterControlRegisterB: UInt8 { get set }
    static var timerCounterNumber: UInt8 { get set }
    static var outputCompareRegisterA: UInt8 { get set }
    static var outputCompareRegisterB: UInt8 { get set }
    static var timerInterruptMaskRegister: UInt8 { get set }
    static var timerInterruptFlagRegister: UInt8 { get set }
}


typealias timer0 = AVRTimer0


// NOTE: PRTIM2 needs to be written to zero to enable Timer/Counter2 module. See Datasheet section 18.2 // This was true for the ATmega328p, but probably applies to the ATtiny13A. Double check this.
struct Timer0: AVRTimer0 {
    
    /// 11.9.1 TCCR0A – Timer/Counter Control Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0x2F)       | COM0A1| COM0A0| COM0B1| COM0B0|   -   |   -   | WGM01 | WGM01
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
    // (0x33)       | FOC0A | FOC2B |   -   |   -   | WGM22 | CS22  | CS21  | CS20  |
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


extension AVRTimer0 {
    
    
    
    // TODO: Figure out what FOC2A and FOC2B are for.
    
    // NOTE: There are many uses for PWM, some as simple as holding the same pulse width and only changing periodically for hobby servo control or LED brightness,
    // while more advanced uses can use the timer interupt to dynamically change the pulse width to output complex wave forms.
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
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
    
    /// See ATMega328p Datasheet Table 18-8.
    /// Table 18-8. Waveform Generation Mode Bit Description
    //
    //---------------------------------------------------------------------------------------------------
    //  Mode  | WGM22 | WGM21 | WGM20 | Mode of Operation  |  TOP  | Update of OCRx at | TOV Flag Set on |
    //---------------------------------------------------------------------------------------------------
    //    0   |   0   |   0   |   0   | Normal             | 0xFF  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    1   |   0   |   0   |   1   | PWM, Phase Correct | 0xFF  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    2   |   0   |   1   |   0   | CTC                | OCRA  | Immediate         | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    3   |   0   |   1   |   1   | Fast PWM           | 0xFF  | BOTTOM            | MAX             |
    //---------------------------------------------------------------------------------------------------
    //    4   |   1   |   0   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    5   |   1   |   0   |   1   | PWM, Phase Correct | OCRA  | TOP               | BOTTOM          |
    //---------------------------------------------------------------------------------------------------
    //    6   |   1   |   1   |   0   | Reserved           |   -   |         -         |        -        |
    //---------------------------------------------------------------------------------------------------
    //    7   |   1   |   1   |   1   | Fast PWM           | OCRA  | BOTTOM            | TOP             |
    //---------------------------------------------------------------------------------------------------
    //Notes: 1. MAX= 0xFF
    //       2. BOTTOM= 0x00
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
}




