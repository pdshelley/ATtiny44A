//===----------------------------------------------------------------------===//
//
// Mode.swift
// Swift For Arduino
//
// Created by Paul Shelley on 12/2/20.
// Copyright © 2020 Paul Shelley. All rights reserved.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Mode Datatype and Supporting Operators
//===----------------------------------------------------------------------===//
@frozen
public struct Mode {
    public var _value: Bool

    @_transparent
    public init(_ _value: Bool) {
        self._value = _value
    }

    @inlinable
    @inline(__always)
    public static var output: Mode { Mode(true) }

    @inlinable
    @inline(__always)
    public static var input: Mode { Mode(false) }
}

// TODO: Do This
//extension Mode: CustomStringConvertible {
//  /// A textual representation of the Mode.
//  @inlinable
//  public var description: String {
//    return self ? "output" : "input"
//  }
//}

extension Mode: Equatable {
    @_transparent
    public static func == (lhs: Mode, rhs: Mode) -> Bool {
        return lhs._value == rhs._value
    }
}

extension Mode: Hashable {
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    @_transparent
    public func hash(into hasher: inout Hasher) {
        hasher.combine((self._value ? 1 : 0) as UInt8)
    }
}

////===----------------------------------------------------------------------===//
//// Operators
////===----------------------------------------------------------------------===//
extension Mode {
  /// Performs a logical NOT operation on a Mode.
  ///
  /// The logical NOT operator (`!`) inverts a Mode. If the value is
  /// `output`, the result of the operation is `input`; if the value is `input`,
  /// the result is `output`.
  ///
  /// - Parameter a: The Mode to negate.
  @inlinable
  @inline(__always)
  public static prefix func ! (lhs: Mode) -> Mode { Mode(!lhs._value) }
}

extension Mode {
  /// Performs a logical AND operation on two Modes.
  ///
  /// The logical AND operator (`&&`) combines two Modes and returns
  /// `output` if both of the values are `output`. If either of the values is
  /// `input`, the operator returns `input`.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand side of the operation.
  ///   - rhs: The right-hand side of the operation.
  @inlinable
  @inline(__always)
  public static func && (lhs: Mode, rhs: Mode) -> Mode {
        return Mode(lhs._value && rhs._value)
  }

  /// Performs a logical OR operation on two Modes.
  ///
  /// The logical OR operator (`||`) combines two Modes and returns
  /// `output` if at least one of the values is `output`. If both values are
  /// `input`, the operator returns `input`.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand side of the operation.
  ///   - rhs: The right-hand side of the operation.
  @inlinable
  @inline(__always)
  public static func || (lhs: Mode, rhs: Mode) -> Mode {
      return Mode(lhs._value || rhs._value)
  }
}

extension Mode {
  /// Toggles the Mode.
  ///
  /// Use this method to toggle a Mode from `output` to `input` or from
  /// `input` to `output`.
  @inlinable
  @inline(__always)
  public mutating func toggle() { self._value = !self._value }
}

