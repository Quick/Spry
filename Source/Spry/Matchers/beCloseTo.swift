//
//  Matcher+beCloseTo.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

let DefaultDelta = 0.0001

private func isCloseTo(_ actualValue: Double, expectedValue: Double, delta: Double = DefaultDelta) -> Bool {
    return abs(actualValue - expectedValue) < delta
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func beCloseTo(_ expectedValue: Double, within delta: Double = DefaultDelta) -> Matcher<Double> {
    return Matcher { expression in
        guard let actualValue = try expression.evaluate() else { return false }
        return isCloseTo(actualValue, expectedValue: expectedValue, delta: delta)
    }
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func beCloseTo(_ expectedValues: [Double], within delta: Double = DefaultDelta) -> Matcher <[Double]> {
    return Matcher { expression in
        if let actual = try expression.evaluate() {
            if actual.count != expectedValues.count {
                return false
            } else {
                for (index, actualItem) in actual.enumerated() {
                    if fabs(actualItem - expectedValues[index]) > delta {
                        return false
                    }
                }
                return true
            }
        }
        return false
    }
}

// MARK: - Operators

infix operator ≈ : ComparisonPrecedence

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
@discardableResult
public func ≈(lhs: Expectation<[Double]>, rhs: [Double]) -> Bool {
    return lhs.to(beCloseTo(rhs))
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
@discardableResult
public func ≈(lhs: Expectation<Double>, rhs: Double) -> Bool {
    return lhs.to(beCloseTo(rhs))
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
@discardableResult
public func ≈(lhs: Expectation<Double>, rhs: (expected: Double, delta: Double)) -> Bool {
    return lhs.to(beCloseTo(rhs.expected, within: rhs.delta))
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
@discardableResult
public func ==(lhs: Expectation<Double>, rhs: (expected: Double, delta: Double)) -> Bool {
    return lhs.to(beCloseTo(rhs.expected, within: rhs.delta))
}

// make this higher precedence than exponents so the Doubles either end aren't pulled in
// unexpectantly
precedencegroup PlusMinusOperatorPrecedence {
    higherThan: BitwiseShiftPrecedence
}

infix operator ± : PlusMinusOperatorPrecedence

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func ±(lhs: Double, rhs: Double) -> (expected: Double, delta: Double) {
    return (expected: lhs, delta: rhs)
}
