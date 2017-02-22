//
//  Matcher-beNil.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

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

@discardableResult
public func ==(lhs: NilLiteral, rhs: NilLiteral) -> Bool { return true }

@discardableResult
public func ==<T>(lhs: Expectation<T>, rhs: NilLiteral) -> Bool {
    return lhs.to(beNil())
}

@discardableResult
public func !=<T>(lhs: Expectation<T>, rhs: NilLiteral) -> Bool {
    return lhs.toNot(beNil())
}
