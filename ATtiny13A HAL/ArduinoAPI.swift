//===----------------------------------------------------------------------===//
//
// ArduinoAPI.swift
// Swift For Arduino
//
// Created by Paul Shelley on 11/28/2022.
// Copyright © 2020 Paul Shelley. All rights reserved.
//
//===----------------------------------------------------------------------===//

//import ATmega328P


//@inlinable
//public var USART_RX_vect: @convention(c) () -> Void {
//	get {
//		return getUSART_RX_vect_cb()
//	}
//	set {
//		setUSART_RX_vect_cb(newValue)
//	}
//}


@inlinable
@inline(__always)
func analogWrite(value: UInt8) {
    timer0.waveformGenerationMode = .fastPWM
    timer0.prescalor = .sixtyFour
    timer0.CompareOutputModeB = .clear
    timer0.outputCompareRegisterB = value
}


// TODO: This should accept a paramiter for baud rate.
//@inline(__always)
//func setupSerial(baudRate: UInt32) {
//    uart0.parityMode = .disabled
//    uart0.numberOfDataBits = .eight
//    uart0.numberOfStopBits = .one
//    uart0.baudRate = baudRate
//    uart0.receiverEnable = .on
//    uart0.transmitterEnable = .on
//    uart0.rxCompleteInterruptEnable = .on
//}
//
//func write(_ data: StaticString) {
//    uart0.write(data)
//}
//
//func write(_ byte: UInt8) {
//    uart0.write(byte)
//}
//
//
//func available() -> Bool {
//    uart0.available()
//}
//
//func read() -> UInt8 {
//    uart0.read()
//}
//
//enum RxBufferErrors: UInt8, Error {
//    case cannotAllocateRingBuffer
//    case noRingBuffer
//}
//
//let rxRingBufferSize: Int = 5
//let rxRingBuffer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: rxRingBufferSize)
//var rxBufferStart: Int = 0
//var rxBufferEnd: Int = 0
//var bufferFull = false
//
//func rxBufferAvailable() -> Bool {
//    rxBufferStart != rxBufferEnd || bufferFull
//}
//
//func rxBufferRead() -> UInt8? {
//    guard let rxRingBuffer = rxRingBuffer else {
//        return nil
////        throw RxBufferErrors.noRingBuffer
//    }
//
//    // block until data is available
//    while !rxBufferAvailable() {}
//
//    disable_interrupts()
//    let byte = rxRingBuffer[rxBufferStart]
//    rxBufferStart += 1
//    rxBufferStart %= rxRingBufferSize
//    bufferFull = false
//    enable_interrupts()
//    return byte
//}
//
//func rxInterruptHandler() {
//    // do not read bytes if buffer is full
//    guard !bufferFull, let rxRingBuffer = rxRingBuffer else { return }
//
//    rxRingBuffer[rxBufferEnd] = read()
//    rxBufferEnd += 1
//    rxBufferEnd %= rxRingBufferSize
//    bufferFull = rxBufferStart == rxBufferEnd
//}
//
//func activateRxInterruptHandler() {
//    guard rxRingBuffer != nil else {
//        return
////        throw RxBufferErrors.cannotAllocateRingBuffer
//    }
//
//    USART_RX_vect = rxInterruptHandler
//    uart0.rxCompleteInterruptEnable = .on
//    enable_interrupts()
//}
//
//
//
//let intBufferLength = 6
//let intBuffer = UnsafeMutableBufferPointer<UInt8>.allocate(capacity: Int(intBufferLength))
//
//func write(_ int: UInt) {
//    guard let intBuffer = intBuffer else { return }
//
//    var int = int
//    var firstIndex = 0
//    for i in (0..<intBufferLength).reversed() {
//        intBuffer[Int(i)] = UInt8(int % UInt(10)) + 48
//        int /= 10
//        if int == 0 {
//            firstIndex = i
//            break
//        }
//    }
//
//    for i in firstIndex..<intBufferLength {
//        write(intBuffer[Int(i)])
//    }
//}
//
//func write(_ int: Int) {
//    guard let intBuffer = intBuffer else { return }
//
//    var int = int
//    
//    if(int<0) {
//        write("-")
//        int = int * -1
//    }
//    
//    var firstIndex = 0
//    for i in (0..<intBufferLength).reversed() {
//        intBuffer[Int(i)] = UInt8(int % 10) + 48
//        int /= 10
//        if int == 0 {
//            firstIndex = i
//            break
//        }
//    }
//
//    for i in firstIndex..<intBufferLength {
//        write(intBuffer[Int(i)])
//    }
//}
//
//func write(_ number: Float, decimalPlaces: Int = 2, decimalSeparator: StaticString = ",") {
//    let integerPart = UInt8(abs(number))
//    let decimalPart = abs(number) - Float(integerPart)
//    
//    // Print out the digits of the integer part
//    var n = integerPart
//    var divisor = 1
//    while n / divisor >= 10 {
//        divisor *= 10
//    }
//    while divisor > 0 {
//        let digit = n / divisor
//        write(digit + 48)
//        n -= digit * divisor
//        divisor /= 10
//    }
//    
//    // Print out the digits of the decimal part
//    if decimalPart > 0 {
//        write(decimalSeparator)
//        var m = decimalPart
//        for _ in 0..<decimalPlaces {
//            m *= 10
//            let digit = Int(m)
//            write(digit)
//            m -= Float(digit)
//        }
//    }
//}
//
//func write(_ bool: Bool) {
//    if(bool){
//        write(1)
//    } else {
//        write(0)
//    }
//}
//
//
//
//
//
