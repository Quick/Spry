//
//  EqualTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

/// A Nimble matcher that succeeds when the actual value is equal to the expected value.
/// Values can support equal by supporting the Equatable protocol.
///
/// @see beCloseTo if you want to match imprecise types (eg - floats, doubles).
public func equal<T: Equatable>(_ expectedValue: T) -> Matcher<T> {
    return Matcher { expression in
        let actualValue = try expression.evaluate()
        return actualValue == expectedValue
    }
}

/// A Nimble matcher that succeeds when the actual value is equal to the expected value.
/// Values can support equal by supporting the Equatable protocol.
///
/// @see beCloseTo if you want to match imprecise types (eg - floats, doubles).
public func equal<T: Equatable, C: Equatable>(_ expectedValue: [T: C]) -> Matcher<[T: C]> {
    return Matcher { expression in
        guard let actualValue = try expression.evaluate() else { return false }
        return expectedValue == actualValue
    }
}

/// A Nimble matcher that succeeds when the actual collection is equal to the expected collection.
/// Items must implement the Equatable protocol.
public func equal<T: Equatable>(_ expectedValue: [T]) -> Matcher<[T]> {
    return Matcher { expression in
        let _actualValue = try expression.evaluate()
        guard let actualValue = _actualValue else { return false }
        return expectedValue == actualValue
    }
}

/// A Nimble matcher allowing comparison of collection with optional type
public func equal<T: Equatable>(_ expectedValue: [T?]) -> Matcher<[T?]> {
    return Matcher { expression in
        if let actualValue = try expression.evaluate() {
            if expectedValue.count != actualValue.count {
                return false
            }
            
            for (index, item) in actualValue.enumerated() {
                let otherItem = expectedValue[index]
                if item == nil && otherItem == nil {
                    continue
                } else if item == nil && otherItem != nil {
                    return false
                } else if item != nil && otherItem == nil {
                    return false
                } else if item! != otherItem! {
                    return false
                }
            }
            
            return true
        }
        
        return false
    }
}

/// A Nimble matcher that succeeds when the actual set is equal to the expected set.
public func equal<T>(_ expectedValue: Set<T>) -> Matcher<Set<T>> {
    return equalSet(expectedValue)
}

/// A Nimble matcher that succeeds when the actual set is equal to the expected set.
public func equal<T: Comparable>(_ expectedValue: Set<T>) -> Matcher<Set<T>> {
    return equalSet(expectedValue)
}

private func equalSet<T>(_ expectedValue: Set<T>) -> Matcher<Set<T>> {
    return Matcher { actualExpression in
        if let actualValue = try actualExpression.evaluate(),
            expectedValue == actualValue {
            return true
        }
        
        return false
    }
}

// Operator Overloads

/// A Nimble matcher that succeeds when the actual value is equal to the expected value.
/// Values can support equal by supporting the Equatable protocol.
///
/// @see beCloseTo if you want to match imprecise types (eg - floats, doubles).
@discardableResult
public func ==<T: Equatable>(lhs: Expectation<T>, rhs: T) -> ExpectationResult {
    return lhs.to(equal(rhs))
}

/// A Nimble matcher that succeeds when the actual value is not equal to the expected value.
/// Values can support equal by supporting the Equatable protocol.
///
/// @see beCloseTo if you want to match imprecise types (eg - floats, doubles).
@discardableResult
public func !=<T: Equatable>(lhs: Expectation<T>, rhs: T) -> ExpectationResult {
    return lhs.toNot(equal(rhs))
}

/// A Nimble matcher that succeeds when the actual collection is equal to the expected collection.
/// Items must implement the Equatable protocol.
@discardableResult
public func ==<T: Equatable>(lhs: Expectation<[T]>, rhs: [T]?) -> ExpectationResult {
    return lhs.to(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual collection is not equal to the expected collection.
/// Items must implement the Equatable protocol.
@discardableResult
public func !=<T: Equatable>(lhs: Expectation<[T]>, rhs: [T]?) -> ExpectationResult {
    return lhs.toNot(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual set is equal to the expected set.
@discardableResult
public func == <T>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> ExpectationResult {
    return lhs.to(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual set is not equal to the expected set.
@discardableResult
public func != <T>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> ExpectationResult {
    return lhs.toNot(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual set is equal to the expected set.
@discardableResult
public func ==<T: Comparable>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> ExpectationResult {
    return lhs.to(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual set is not equal to the expected set.
@discardableResult
public func !=<T: Comparable>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> ExpectationResult {
    return lhs.toNot(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual value is equal to the expected value.
/// Values can support equal by supporting the Equatable protocol.
///
/// @see beCloseTo if you want to match imprecise types (eg - floats, doubles).
@discardableResult
public func ==<T: Equatable, C: Equatable>(lhs: Expectation<[T: C]>, rhs: [T: C]?) -> ExpectationResult {
    return lhs.to(equal(rhs!))
}

/// A Nimble matcher that succeeds when the actual value is not equal to the expected value.
/// Values can support equal by supporting the Equatable protocol.
///
/// @see beCloseTo if you want to match imprecise types (eg - floats, doubles).
@discardableResult
public func !=<T: Equatable, C: Equatable>(lhs: Expectation<[T: C]>, rhs: [T: C]?) -> ExpectationResult {
    return lhs.toNot(equal(rhs!))
}
