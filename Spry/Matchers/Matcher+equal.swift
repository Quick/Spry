//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

public func equal<T: Equatable>(_ expectedValue: T) -> Matcher<T> {
    return Matcher { expression in
        let actualValue = try expression.evaluate()
        return actualValue == expectedValue
    }
}

public func equal<T: Equatable, C: Equatable>(_ expectedValue: [T: C]) -> Matcher<[T: C]> {
    return Matcher { expression in
        guard let actualValue = try expression.evaluate() else { return false }
        return expectedValue == actualValue
    }
}

public func equal<T: Equatable>(_ expectedValue: [T]) -> Matcher<[T]> {
    return Matcher { expression in
        let _actualValue = try expression.evaluate()
        guard let actualValue = _actualValue else { return false }
        return expectedValue == actualValue
    }
}

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

public func equal<T>(_ expectedValue: Set<T>) -> Matcher<Set<T>> {
    return equalSet(expectedValue)
}

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

@discardableResult
public func ==<T: Equatable>(lhs: Expectation<T>, rhs: T) -> Bool {
    return lhs.to(equal(rhs))
}

@discardableResult
public func !=<T: Equatable>(lhs: Expectation<T>, rhs: T) -> Bool {
    return lhs.toNot(equal(rhs))
}

@discardableResult
public func ==<T: Equatable>(lhs: Expectation<[T]>, rhs: [T]?) -> Bool {
    return lhs.to(equal(rhs!))
}

@discardableResult
public func !=<T: Equatable>(lhs: Expectation<[T]>, rhs: [T]?) -> Bool {
    return lhs.toNot(equal(rhs!))
}

@discardableResult
public func == <T>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> Bool {
    return lhs.to(equal(rhs!))
}

@discardableResult
public func != <T>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> Bool {
    return lhs.toNot(equal(rhs!))
}

@discardableResult
public func ==<T: Comparable>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> Bool {
    return lhs.to(equal(rhs!))
}

@discardableResult
public func !=<T: Comparable>(lhs: Expectation<Set<T>>, rhs: Set<T>?) -> Bool {
    return lhs.toNot(equal(rhs!))
}

@discardableResult
public func ==<T: Equatable, C: Equatable>(lhs: Expectation<[T: C]>, rhs: [T: C]?) -> Bool {
    return lhs.to(equal(rhs!))
}

@discardableResult
public func !=<T: Equatable, C: Equatable>(lhs: Expectation<[T: C]>, rhs: [T: C]?) -> Bool {
    return lhs.toNot(equal(rhs!))
}
