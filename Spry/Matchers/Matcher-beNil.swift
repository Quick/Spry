//
//  Matcher-beNil.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

public struct NilLiteral: ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {}
    public init() {}
}

extension NilLiteral: Equatable {}

public func ==(lhs: NilLiteral, rhs: NilLiteral) -> Bool { return true }

public func ==<T>(lhs: Expectation<T>, rhs: NilLiteral) -> Bool {
    return lhs.to(beNil())
}

public func !=<T>(lhs: Expectation<T>, rhs: NilLiteral) -> Bool {
    return lhs.toNot(beNil())
}

public func beNil<T>() -> Matcher<T> {
    return Matcher { expression in
        return try expression.evaluate() == nil
    }
}
