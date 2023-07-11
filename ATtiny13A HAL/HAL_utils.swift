//===----------------------------------------------------------------------===//
//
// HAL_utils.swift
// Swift For Arduino
//
// Created by Carl Peto & Paul Shelley on 11/27/20.
// Copyright © 2020 Swift4Arduino. All rights reserved.
//
//===----------------------------------------------------------------------===//

import libc

// Note: This will be removed but is here for testing
func waitOneSecond() {
    for _ in 0..<64 {
        _delay_loop_2(0)
    }
}

// Note: This will be removed but is here for testing
func block(for seconds: UInt8) {
    let adjusted = seconds * 64
    for _ in 0..<adjusted {
        _delay_loop_2(0)
    }
}
// Note: Made for testing purpose
func delayMilliSeconds(ms: UInt64) {
    let adjusted = ms/1000 * 64
    for _ in 0..<adjusted {
        _delay_loop_2(0)
    }
}

// Note: Made for testing purpose
func delayMicroSeconds(us: UInt64) {
    let adjusted = us/1000000 * 64
    for _ in 0..<adjusted {
        _delay_loop_2(0)
    }
}
