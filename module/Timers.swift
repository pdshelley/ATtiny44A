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

// Timer0 would conform to GeneralAVRTimerSettings, AVR8BitTimerSettings, HasExternalClockTimer
// Timer1 would conform to GeneralAVRTimerSettings, AVR16BitTimerSettings, HasExternalClockTimer
// Timer2 would conform to GeneralAVRTimerSettings, AVR8BitTimerSettings, InternalClockTimerOnly, and AsyncTimer
// TODO: I think Timer 0 and 1 use the prescaler with the external clock while timer 2 only uses the internal clock
// TODO: What happens with chips that have multiple Async Timers? Is this possible?
// TODO: Explore using Generics vs Protocols

//protocol GeneralAVRTimerSettings {
//    // TODO: These first 4 properties are the same for all timers so they could be in a "Universal" AVRTimerSettings protocol.
//    static var timerCounterControlRegisterA: UInt8 { get set }
//    static var timerCounterControlRegisterB: UInt8 { get set }
//    static var timerInterruptMaskRegister: UInt8 { get set }
//    static var timerInterruptFlagRegister: UInt8 { get set }
//    
//    enum CompareOutputModeOption: UInt8 {
//        case normal = 0
//        case toggle = 1 // TODO: Sometimes this is Reserved and does not work with some Waveform Generation Modes
//        case clear = 2
//        case set = 3
//    }
//}
//
//// TODO: Verify that this assumption is correct.
//protocol AsyncTimer {
//    // These are only used on the Async timer2?
//    static var ASSR:   UInt8 { get set } // TODO: Update this name.
//    static var GTCCR:  UInt8 { get set } // TODO: Update this name.
//}
//
//protocol AVR8BitTimerSettings {
//    // TODO: These 3 properties change type from UInt8 to UInt16 depending on if the timer is an 8 Bit timer or 16 Bit Timer. They should probably be in their own protocols.
//    static var timerCounterNumber: UInt8 { get set }
//    static var outputCompareRegisterA: UInt8 { get set }
//    static var outputCompareRegisterB: UInt8 { get set }
//    
//    enum WaveformGenerationModeOption: UInt8 {
//        case normal = 0
//        case phaseCorrectPWM = 1
//        case clearTimerOnCompareMatch = 2
//        case fastPWM = 3
//        
//        // Note: The difference in Modes 5 and 7 are that the Output Compare Register (OCRA or OCRB) is the "Top" where in modes 1 and 3, 255 (0xFF) is the "Top".
//        case advancedPhaseCorrectPWM = 5 // TODO: What should this be called?
//        case advancedFastPWM = 7  // TODO: What should this be called?
//    }
//    
//
//}
//
//Protocol HasExternalClockTimer {
//    enum Prescaling: UInt8 {
//        case noClockSource = 0 // No Clock Source - counter is off
//        case none = 1 // clkT2S - No Prescaler
//        case eight = 2 // clkT2S/8
//        case thirtyTwo = 3 // clkT2S/32
//        case sixtyFour = 4 // clkT2S/64
//        case oneTwentyEight = 5 // clkT2S/128
//        case twoFiftySix = 6 // clkT2S/256
//        case tenTwentyFour = 7 // clkT2S/1024
//    }
//}
//
//protocol InternalClockTimerOnly {
//    enum Prescaling: UInt8 {
//        case noClockSource = 0
//        case none = 1
//        case eight = 2
//        case sixtyFour = 3
//        case twoFiftySix = 4
//        case tenTwentyFour = 5
//        case externalClockOnFallingEdge = 6
//        case externalClockOnRisingEdge = 7
//    }
//}
//
//
//protocol AVR16BitTimerSettings {
//    
//    // TODO: 16 Bit timers have an extra control register C. Wave Form Generation has more modes, other settings might also be more granular.
//    static var timerCounterControlRegisterC: UInt8 { get set }
//    
//    // TODO: These 3 properties change type from UInt8 to UInt16 depending on if the timer is an 8 Bit timer or 16 Bit Timer. They should probably be in their own protocols.
//    static var timerCounterNumber: UInt16 { get set }
//    static var outputCompareRegisterA: UInt16 { get set }
//    static var outputCompareRegisterB: UInt16 { get set }
//    
//    enum WaveformGenerationModeOption: UInt8 {
//        case normal = 0
//        case phaseCorrectPWM8Bit = 1
//        case phaseCorrectPWM9Bit = 2
//        case phaseCorrectPWM10Bit = 3
//        case clearTimerCountOnOutputCompairRegister = 4 // TODO: I think naming needs to be updated to be similar to this on the 8 bit version.
//        case fastPWM8Bit = 5
//        case fastPWM9Bit = 6
//        case fastPWM10Bit = 7
//        case phaseAndFrequencyCorrectPWMOnInputCaptureRegister = 8 // TODO: Update the names of the 8 bit version to be similar to this
//        case phaseAndFrequencyCorrectPWMOnOutputCompairRegister = 9
//        case phaseCorrectPWMOnInputCaptureRegister = 10
//        case phaseCorrectPWMOnOutputCompairRegister = 11
//        case clearTimerCountOnInputCaptureRegister = 12
//        case fastPWMOnInputCaptureRegister = 14
//        case fastPWMOnOutputCompairRegister = 15
//    }
//}






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
    static var asynchronousStatusRegister: UInt8 { get set }
    static var generalTimerCounterControlRegister: UInt8 { get set }
}


typealias timer0 = AVRTimer0


/// Timer 2 implementation for ATmega48A/PA/88A/PA/168A/PA/328/P
// NOTE: PRTIM2 needs to be written to zero to enable Timer/Counter2 module. See Datasheet section 18.2
struct Timer0: AVRTimer0 {
    

    static var timerCounterControlRegisterA: UInt8 {
        get {
            _rawPointerRead(address: 0x44)
        }
        set {
            _rawPointerWrite(address: 0x44, value: newValue)
        }
    }
    
    
    /// 18.11.2 TCCR2B – Timer/Counter Control Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       | FOC2A | FOC2B |   -   |   -   | WGM22 | CS22  | CS21  | CS20  |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |   R   |   R   |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var timerCounterControlRegisterB: UInt8 {
        get {
            _rawPointerRead(address: 0x45)
        }
        set {
            _rawPointerWrite(address: 0x45, value: newValue)
        }
    }
    
    
    
    
    /// 18.11.3 TCNT2 – Timer/Counter Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         TCNT2                                 |
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
            return _rawPointerRead(address: 0x46)
        }
        set {
            _rawPointerWrite(address: 0x46, value: newValue)
        }
    }
    
    
    
    /// 18.11.4 OCR2A – Output Compare Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         OCR2A                                 |
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
            return _rawPointerRead(address: 0x47)
        }
        set {
            _rawPointerWrite(address: 0x47, value: newValue)
        }
    }
    
    
    
    /// 18.11.5 OCR2B – Output Compare Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         OCR2B                                 |
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
            return _rawPointerRead(address: 0x48)
        }
        set {
            _rawPointerWrite(address: 0x48, value: newValue)
        }
    }
    
    
    /// 18.11.6 TIMSK2 – Timer/Counter2 Interrupt Mask Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   |   -   |   -   |   -   |   -   |OCIE2B |OCIE2A | TOIE2 |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |
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
            return _rawPointerRead(address: 0x6E)
        }
        set {
            _rawPointerWrite(address: 0x6E, value: newValue)
        }
    }
    
    
    /// 18.11.7 TIFR2 – Timer/Counter2 Interrupt Flag Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   |   -   |   -   |   -   |   -   | OCF2B | OCF2A | TOV2  |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |
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
            return _rawPointerRead(address: 0x35)
        }
        set {
            _rawPointerWrite(address: 0x35, value: newValue)
        }
    }
    
    
    /// 18.11.8 ASSR – Asynchronous Status Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   | EXCLK |  AS2  |TCN2UB |OCR2AUB|OCR2BUB|TCR2AUB|TCR2BUB|
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |  R/W  |  R/W  |   R   |   R   |   R   |   R   |   R   |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the ASSR (Asynchronous Status Register) is used for.
    // TODO: Decide about simplifying this with ASSR
    @inlinable
    @inline(__always)
    static var asynchronousStatusRegister: UInt8 {
        get {
            return _rawPointerRead(address: 0xB6) // TODO: is this register address shared by all timers?
        }
        set {
            _rawPointerWrite(address: 0xB6, value: newValue) // TODO: is this register address shared by all timers?
        }
    }
    
    
    
    /// 18.11.9 GTCCR – General Timer/Counter Control Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |  TSM  |   -   |   -   |   -   |   -   |   -   |PSRASY |PSRSYNC|
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the GTCCR (General Timer/Counter Control Register) is used for.
    // TODO: Decide about simplifying this with GTCCR
    @inlinable
    @inline(__always)
    static var generalTimerCounterControlRegister: UInt8 {
        get {
            return _rawPointerRead(address: 0x43)
        }
        set {
            _rawPointerWrite(address: 0x43, value: newValue)
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

protocol AVRTimer1{
    // TODO: These first 4 properties are the same for all timers so they could be in a "Universal" AVRTimerSettings protocol.
    static var timerCounterControlRegisterA: UInt8 { get set }
    static var timerCounterControlRegisterB: UInt8 { get set }
    static var timerInterruptMaskRegister: UInt8 { get set }
    static var timerInterruptFlagRegister: UInt8 { get set }
    
    // TODO: 16 Bit timers have an extra control register C. Wave Form Generation has more modes, other settings might also be more granular.
    static var timerCounterControlRegisterC: UInt8 { get set }
    
    // TODO: These 3 properties change type from UInt8 to UInt16 depending on if the timer is an 8 Bit timer or 16 Bit Timer. They should probably be in their own protocols.
    static var timerCounterNumber: UInt16 { get set }
//    static var timerCounterNumberLowByte: UInt8 { get set }
//    static var timerCounterNumberHighByte: UInt8 { get set }
    
    static var outputCompareRegisterA: UInt16 { get set }
//    static var outputCompareRegisterALowByte: UInt8 { get set }
//    static var outputCompareRegisterAHighByte: UInt8 { get set }
    
    static var outputCompareRegisterB: UInt16 { get set }
//    static var outputCompareRegisterBLowByte: UInt8 { get set }
//    static var outputCompareRegisterBHighByte: UInt8 { get set }
    
    

    
    // I think these are only used on Timer2. We probably need another protocol for AsyncTimer that includes these.
//    static var asynchronousStatusRegister: UInt16 { get set }
//    static var generalTimerCounterControlRegister: UInt8 { get set }
}


typealias timer1 = AVRTimer1


/// Timer 2 implementation for ATmega48A/PA/88A/PA/168A/PA/328/P
// NOTE: PRTIM2 needs to be written to zero to enable Timer/Counter2 module. See Datasheet section 18.2
struct Timer1: AVRTimer1 {
    

    static var timerCounterControlRegisterA: UInt8 {
        get {
            _rawPointerRead(address: 0x80)
        }
        set {
            _rawPointerWrite(address: 0x80, value: newValue)
        }
    }
    
    
    /// 18.11.2 TCCR2B – Timer/Counter Control Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       | FOC2A | FOC2B |   -   |   -   | WGM22 | CS22  | CS21  | CS20  |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |   R   |   R   |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var timerCounterControlRegisterB: UInt8 {
        get {
            _rawPointerRead(address: 0x81)
        }
        set {
            _rawPointerWrite(address: 0x81, value: newValue)
        }
    }
    
    
    static var timerCounterControlRegisterC: UInt8 {
        get {
            _rawPointerRead(address: 0x82)
        }
        set {
            _rawPointerWrite(address: 0x82, value: newValue)
        }
    }
    
    
    
    /// 18.11.3 TCNT2 – Timer/Counter Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         TCNT2                                 |
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
    static var timerCounterNumber: UInt16 {
        get {
            return (UInt16(TCNT1H) << 8) | UInt16(TCNT1L)
        }
        set {
            TCNT1H = UInt8((newValue & 0b1111111100000000) >> 8)
            TCNT1L = UInt8(newValue & 0b11111111)
        }
    }
    
    @inlinable
    @inline(__always)
    static var TCNT1L: UInt8 { //TCNT1L
        get {
            return _rawPointerRead(address: 0x84)
        }
        set {
            _rawPointerWrite(address: 0x84, value: newValue)
        }
    }
    
    @inlinable
    @inline(__always)
    static var TCNT1H: UInt8 { //TCNT1H
        get {
            return _rawPointerRead(address: 0x85)
        }
        set {
            _rawPointerWrite(address: 0x85, value: newValue)
        }
    }
    
    
    
    /// 18.11.4 OCR2A – Output Compare Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         OCR2A                                 |
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
    static var outputCompareRegisterA: UInt16 {
        get {
            return (UInt16(OCR1AH) << 8) | UInt16(OCR1AL)
        }
        set {
            OCR1AH = UInt8((newValue & 0b1111111100000000) >> 8)
            OCR1AL = UInt8(newValue & 0b11111111)
        }
    }
    
    @inlinable
    @inline(__always)
    static var OCR1AL: UInt8 {
        get {
            return _rawPointerRead(address: 0x88)
        }
        set {
            _rawPointerWrite(address: 0x88, value: newValue)
        }
    }
    static var OCR1AH: UInt8 {
        get {
            return _rawPointerRead(address: 0x89)
        }
        set {
            _rawPointerWrite(address: 0x89, value: newValue)
        }
    }
    
    
    
    
    /// 18.11.5 OCR2B – Output Compare Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         OCR2B                                 |
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
    static var outputCompareRegisterB: UInt16 {
        get {
            return (UInt16(OCR1BH) << 8) | UInt16(OCR1BL)
        }
        set {
            OCR1BH = UInt8((newValue & 0b1111111100000000) >> 8)
            OCR1BL = UInt8(newValue & 0b11111111)
        }
    }

    
    
    @inlinable
    @inline(__always)
    static var OCR1BL: UInt8 {
        get {
            return _rawPointerRead(address: 0x8A)
        }
        set {
            _rawPointerWrite(address: 0x8A, value: newValue)
        }
    }
    @inlinable
    @inline(__always)
    static var OCR1BH: UInt8 {
        get {
            return _rawPointerRead(address: 0x8B)
        }
        set {
            _rawPointerWrite(address: 0x8B, value: newValue)
        }
    }
    
    
    /// 18.11.6 TIMSK2 – Timer/Counter2 Interrupt Mask Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   |   -   |   -   |   -   |   -   |OCIE2B |OCIE2A | TOIE2 |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |
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
            return _rawPointerRead(address: 0x6F)
        }
        set {
            _rawPointerWrite(address: 0x6F, value: newValue)
        }
    }
    
    
    /// 18.11.7 TIFR2 – Timer/Counter2 Interrupt Flag Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   |   -   |   -   |   -   |   -   | OCF2B | OCF2A | TOV2  |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |
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
            return _rawPointerRead(address: 0x36)
        }
        set {
            _rawPointerWrite(address: 0x36, value: newValue)
        }
    }
}


extension AVRTimer1 {
    
    
    
    // TODO: Figure out what FOC2A and FOC2B are for.
    
    // NOTE: There are many uses for PWM, some as simple as holding the same pulse width and only changing periodically for hobby servo control or LED brightness,
    // while more advanced uses can use the timer interupt to dynamically change the pulse width to output complex wave forms.
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
    @inlinable
    @inline(__always)
    static var CompareOutputModeA: Timers16Bit.CompareOutputModeOption {
        get {
            let mode = (timerCounterControlRegisterA & 0b11000000) >> UInt8(6)
            return Timers16Bit.CompareOutputModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            timerCounterControlRegisterA |= (newValue.rawValue & 0b00000011) << UInt8(6)
        }
    }
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
    @inlinable
    @inline(__always)
    static var CompareOutputModeB: Timers16Bit.CompareOutputModeOption {
        get {
            let mode = (timerCounterControlRegisterA & 0b00110000) >> 4
            return Timers16Bit.CompareOutputModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            timerCounterControlRegisterA |= (newValue.rawValue & 0b00000011) << UInt8(4)
        }
    }
    
    @inlinable
    @inline(__always)
    static var prescalor: Timers16Bit.Prescaling {
        get {
            let mode = timerCounterControlRegisterA & 0b00000111
            return Timers16Bit.Prescaling.init(rawValue: mode) ?? .noClockSource
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
    // TODO: This is different for the 16 bit timer!!!
    @inlinable
    @inline(__always)
    static var waveformGenerationMode: Timers16Bit.WaveformGenerationModeOption {
        get {
            let mode = ((timerCounterControlRegisterB & 0b00001000) >> 1) | (timerCounterControlRegisterA & 0b00000011)
            return Timers16Bit.WaveformGenerationModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            timerCounterControlRegisterA |= (newValue.rawValue & 0b00000011)
            timerCounterControlRegisterB |= ((newValue.rawValue & 0b00000100) << UInt16(1))
        }
    }
}


protocol TimerPort {
    // this will probably(?) always be UInt8, but is useful for preventing the protocol
    // from ever accidentally being used as an existential type
    //    associatedtype PortDataType: BinaryInteger // TODO: Fix this.
    
    static var TCCR2A: UInt8 { get set }
    static var TCCR2B: UInt8 { get set }
    static var TCNT2:  UInt8 { get set }
    static var OCR2A:  UInt8 { get set }
    static var OCR2B:  UInt8 { get set }
    static var TIMSK2: UInt8 { get set }
    static var TIFR2:  UInt8 { get set }
    static var ASSR:   UInt8 { get set }
    static var GTCCR:  UInt8 { get set }
}

typealias timer2 = Timer2


/// Timer 2 implementation for ATmega48A/PA/88A/PA/168A/PA/328/P
// NOTE: PRTIM2 needs to be written to zero to enable Timer/Counter2 module. See Datasheet section 18.2
struct Timer2: TimerPort {
    
    /// 18.11.1 TCCR2A – Timer/Counter Control Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |COM2A1 |COM2A0 |COM2B1 |COM2B0 |   -   |   -   | WGM21 | WGM20 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |   R   |   R   |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var TCCR2A: UInt8 { get { _rawPointerRead(address: 0xB0) } set { _rawPointerWrite(address: 0xB0, value: newValue) } }
    
    
    /// 18.11.2 TCCR2B – Timer/Counter Control Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       | FOC2A | FOC2B |   -   |   -   | WGM22 | CS22  | CS21  | CS20  |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |   R   |   R   |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var TCCR2B: UInt8 { get { _rawPointerRead(address: 0xB1) } set { _rawPointerWrite(address: 0xB1, value: newValue) } }
    
    
    
    
    /// 18.11.3 TCNT2 – Timer/Counter Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         TCNT2                                 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var TCNT2: UInt8 { get { _rawPointerRead(address: 0xB2) } set { _rawPointerWrite(address: 0xB2, value: newValue) } }
    
    
    
    
    /// 18.11.4 OCR2A – Output Compare Register A
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         OCR2A                                 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var OCR2A: UInt8 { get { _rawPointerRead(address: 0xB3) } set { _rawPointerWrite(address: 0xB3, value: newValue) } }
    
    
    
    
    /// 18.11.5 OCR2B – Output Compare Register B
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |                         OCR2B                                 |
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var OCR2B: UInt8 { get { _rawPointerRead(address: 0xB4) } set { _rawPointerWrite(address: 0xB4, value: newValue) } }
    
    
    
    
    /// 18.11.6 TIMSK2 – Timer/Counter2 Interrupt Mask Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   |   -   |   -   |   -   |   -   |OCIE2B |OCIE2A | TOIE2 |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var TIMSK2: UInt8 { get { _rawPointerRead(address: 0x70) } set { _rawPointerWrite(address: 0x70, value: newValue) } }
    
    
    
    /// 18.11.7 TIFR2 – Timer/Counter2 Interrupt Flag Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   |   -   |   -   |   -   |   -   | OCF2B | OCF2A | TOV2  |
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var TIFR2: UInt8 { get { _rawPointerRead(address: 0x37) } set { _rawPointerWrite(address: 0x37, value: newValue) } }
    
    
    /// 18.11.8 ASSR – Asynchronous Status Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |   -   | EXCLK |  AS2  |TCN2UB |OCR2AUB|OCR2BUB|TCR2AUB|TCR2BUB|
    //-------------------------------------------------------------------------------
    // Read/Write   |   R   |  R/W  |  R/W  |   R   |   R   |   R   |   R   |   R   |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var ASSR: UInt8 { get { _rawPointerRead(address: 0xB6) } set { _rawPointerWrite(address: 0xB6, value: newValue) } }
    
    
    
    /// 18.11.9 GTCCR – General Timer/Counter Control Register
    //
    //-------------------------------------------------------------------------------
    // Bit          |   7   |   6   |   5   |   4   |   3   |   2   |   1   |   0   |
    //-------------------------------------------------------------------------------
    // (0xBC)       |  TSM  |   -   |   -   |   -   |   -   |   -   |PSRASY |PSRSYNC|
    //-------------------------------------------------------------------------------
    // Read/Write   |  R/W  |   R   |   R   |   R   |   R   |   R   |  R/W  |  R/W  |
    //-------------------------------------------------------------------------------
    // InitialValue |   0   |   0   |   0   |   0   |   0   |   0   |   0   |   0   |
    //-------------------------------------------------------------------------------
    //
    static var GTCCR: UInt8 { get { _rawPointerRead(address: 0x43) } set { _rawPointerWrite(address: 0x43, value: newValue) } }
    
    
}



extension TimerPort {
    
    // TODO: I believe OCR2A always needs to be larger than OCR2B. Should we have a safety for this?
    // TODO: Decide about simplifying this with OCR2A
    @inlinable
    @inline(__always)
    static var outputCompareRegisterA: UInt8 {
        get {
            return OCR2A
        }
        set {
            OCR2A = newValue
        }
    }
    
    
    // TODO: I believe OCR2A always needs to be larger than OCR2B. Should we have a safety for this?
    // TODO: Decide about simplifying this with OCR2B
    @inlinable
    @inline(__always)
    static var outputCompareRegisterB: UInt8 {
        get {
            return OCR2B
        }
        set {
            OCR2B = newValue
        }
    }
    
    
    
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the TCNT2 is used for. I think this is just the actual timer counter that is incrimented each tick of the timer.
    // TODO: Decide about simplifying this with TCNT2
    @inlinable
    @inline(__always)
    static var timerCounterNumber: UInt8 {
        get {
            return TCNT2
        }
        set {
            TCNT2 = newValue
        }
    }
    
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the TIFR2 (Timer Interrupt Flag Register) is used for.
    // TODO: Decide about simplifying this with TIFR2
    @inlinable
    @inline(__always)
    static var timerInterruptFlagRegister: UInt8 {
        get {
            return TIFR2
        }
        set {
            TIFR2 = newValue
        }
    }
    
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the TIMSK2 (Timer Interrupt Mask Register) is used for.
    // TODO: Decide about simplifying this with TIMSK2
    @inlinable
    @inline(__always)
    static var timerInterruptMaskRegister: UInt8 {
        get {
            return TIMSK2
        }
        set {
            TIMSK2 = newValue
        }
    }
    
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the ASSR (Asynchronous Status Register) is used for.
    // TODO: Decide about simplifying this with ASSR
    @inlinable
    @inline(__always)
    static var asynchronousStatusRegister: UInt8 {
        get {
            return ASSR
        }
        set {
            ASSR = newValue
        }
    }
    
    // WARNING: This is not fully tested and understood.
    // TODO: Figure out what the GTCCR (General Timer/Counter Control Register) is used for.
    // TODO: Decide about simplifying this with GTCCR
    @inlinable
    @inline(__always)
    static var generalTimerCounterControlRegister: UInt8 {
        get {
            return GTCCR
        }
        set {
            GTCCR = newValue
        }
    }
    
    // TODO: Figure out what FOC2A and FOC2B are for.
    
    // NOTE: There are many uses for PWM, some as simple as holding the same pulse width and only changing periodically for hobby servo control or LED brightness,
    // while more advanced uses can use the timer interupt to dynamically change the pulse width to output complex wave forms.
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
    @inlinable
    @inline(__always)
    static var CompareOutputModeA: Timers.CompareOutputModeOption {
        get {
            let mode = (TCCR2A & 0b11000000) >> UInt8(6)
            return Timers.CompareOutputModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            TCCR2A |= (newValue.rawValue & 0b00000011) << UInt8(6)
        }
    }
    
    
    // TODO: Test This!
    // TODO: Add check for toggle?
    @inlinable
    @inline(__always)
    static var CompareOutputModeB: Timers.CompareOutputModeOption {
        get {
            let mode = (TCCR2A & 0b00110000) >> 4
            return Timers.CompareOutputModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            TCCR2A |= (newValue.rawValue & 0b00000011) << UInt8(4)
        }
    }
    
    @inlinable
    @inline(__always)
    static var prescalor: Timers.Prescaling {
        get {
            let mode = TCCR2B & 0b00000111
            return Timers.Prescaling.init(rawValue: mode) ?? .noClockSource
        }
        set {
            TCCR2B |= newValue.rawValue & 0b00000111
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
            let mode = ((TCCR2B & 0b00001000) >> 1) | (TCCR2A & 0b00000011)
            return Timers.WaveformGenerationModeOption.init(rawValue: mode) ?? .normal
        }
        set {
            TCCR2A |= (newValue.rawValue & 0b00000011)
            TCCR2B |= ((newValue.rawValue & 0b00000100) << UInt8(1))
        }
    }
}
