//
//  Matcher+beCloseTo.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

let DefaultDelta = 0.0001

func isCloseTo(_ actualValue: Double, expectedValue: Double, delta: Double = DefaultDelta) -> Bool {
    return abs(actualValue - expectedValue) < delta
}

public func beCloseTo(_ expectedValue: Double, within delta: Double = DefaultDelta) -> Matcher<Double> {
    return Matcher { expression in
        guard let actualValue = try expression.evaluate() else { return false }
        return isCloseTo(actualValue, expectedValue: expectedValue, delta: delta)
    }
}

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

@discardableResult
public func ≈(lhs: Expectation<[Double]>, rhs: [Double]) -> Bool {
    return lhs.to(beCloseTo(rhs))
}

@discardableResult
public func ≈(lhs: Expectation<Double>, rhs: Double) -> Bool {
    return lhs.to(beCloseTo(rhs))
}

@discardableResult
public func ≈(lhs: Expectation<Double>, rhs: (expected: Double, delta: Double)) -> Bool {
    return lhs.to(beCloseTo(rhs.expected, within: rhs.delta))
}

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
public func ±(lhs: Double, rhs: Double) -> (expected: Double, delta: Double) {
    return (expected: lhs, delta: rhs)
}
