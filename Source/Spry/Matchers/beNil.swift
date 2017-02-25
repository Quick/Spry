//
//  Matcher-beNil.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

/// A Nimble matcher that succeeds when the actual value is nil.
public func beNil<T>() -> Matcher<T> {
    return Matcher { expression in
        return try expression.evaluate() == nil
    }
}


public struct NilLiteral: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {}
    public init() {}
}

extension NilLiteral: Equatable {}

/// A Nimble matcher that succeeds when the actual value is nil.
@discardableResult
public func ==(lhs: NilLiteral, rhs: NilLiteral) -> Bool { return true }

/// A Nimble matcher that succeeds when the actual value is nil.
@discardableResult
public func ==<T>(lhs: Expectation<T>, rhs: NilLiteral) -> ExpectationResult {
    return lhs.to(beNil())
}

/// A Nimble matcher that succeeds when the actual value is not nil.
@discardableResult
public func !=<T>(lhs: Expectation<T>, rhs: NilLiteral) -> ExpectationResult {
    return lhs.toNot(beNil())
}
