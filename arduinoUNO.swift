//===----------------------------------------------------------------------===//
//
// arduinoUNO.swift
// Swift For Arduino
//
// Created by Carl Peto & Paul Shelley on 11/27/20.
// Copyright © 2020 Swift4Arduino. All rights reserved.
//
//===----------------------------------------------------------------------===//


@available(*, deprecated, message: "This level of abstraction is going to be removed from HAL.")
struct arduinoUno {
  typealias chip = ATmega328P
  typealias chip_package = chip.pdip28

  /// Digital Pins:
  typealias pin0 = chip_package.pin2
  typealias pin1 = chip_package.pin3
  typealias pin2 = chip_package.pin4
  typealias pin3 = chip_package.pin5
  typealias pin4 = chip_package.pin6
  typealias pin5 = chip_package.pin11
  typealias pin6 = chip_package.pin12
  typealias pin7 = chip_package.pin13
  typealias pin8 = chip_package.pin14
  typealias pin9 = chip_package.pin15
  typealias pin10 = chip_package.pin16
  typealias pin11 = chip_package.pin17
  typealias pin12 = chip_package.pin18
  typealias pin13 = chip_package.pin19

// Note: Arduino is a bit strange as they have `A0` and `D'14` (or just 14) for the same pin. We should think about what we want to do there.
  typealias a0 = chip_package.pin23
  typealias a1 = chip_package.pin24
  typealias a2 = chip_package.pin25
  typealias a3 = chip_package.pin26
  typealias a4 = chip_package.pin27
  typealias a5 = chip_package.pin28

  typealias reset = chip_package.pin1

// TODO: Figure out what Arduino is doing with all of the B ports and D ports that are not being used, onboard hardware clock maybe? What else?

  /// Timers:

}
