//
//  EqualTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

public func expect<T>(_ expression: (@autoclosure @escaping () throws -> T?)) -> Expectation<T> {
    return Expectation(expression: Expression(expression: expression))
}
