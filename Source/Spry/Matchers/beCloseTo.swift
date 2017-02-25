//
//  Matcher+beCloseTo.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

internal let DefaultDelta = 0.0001

private func isCloseTo(_ actualValue: ConvertibleToDouble?, expectedValue: ConvertibleToDouble, delta: Double) -> Bool {
    return actualValue != nil && abs(actualValue!.doubleValue - expectedValue.doubleValue) < delta
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func beCloseTo(_ expectedValue: Double, within delta: Double = DefaultDelta) -> Matcher<Double> {
    return Matcher { actualExpression in
        return isCloseTo(try actualExpression.evaluate(), expectedValue: expectedValue, delta: delta)
    }
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func beCloseTo(_ expectedValue: ConvertibleToDouble, within delta: Double = DefaultDelta) -> Matcher<ConvertibleToDouble> {
    return Matcher { actualExpression in
        return isCloseTo(try actualExpression.evaluate(), expectedValue: expectedValue, delta: delta)
    }
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func beCloseTo(_ expectedValues: [Double], within delta: Double = DefaultDelta) -> Matcher <[Double]> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate() {
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
public func ≈(lhs: Expectation<[Double]>, rhs: [Double]) -> ExpectationResult {
    return lhs.to(beCloseTo(rhs))
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func ≈(lhs: Expectation<ConvertibleToDouble>, rhs: ConvertibleToDouble) -> ExpectationResult {
    return lhs.to(beCloseTo(rhs))
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func ≈(lhs: Expectation<ConvertibleToDouble>, rhs: (expected: ConvertibleToDouble, delta: Double)) -> ExpectationResult {
    return lhs.to(beCloseTo(rhs.expected, within: rhs.delta))
}

/// A Nimble matcher that succeeds when a value is close to another. This is used for floating
/// point values which can have imprecise results when doing arithmetic on them.
///
/// @see equal
public func == (lhs: Expectation<ConvertibleToDouble>, rhs: (expected: ConvertibleToDouble, delta: Double)) -> ExpectationResult {
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
public func ±(lhs: ConvertibleToDouble, rhs: Double) -> (expected: ConvertibleToDouble, delta: Double) {
    return (expected: lhs, delta: rhs)
}
