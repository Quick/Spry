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

#if os(iOS)
    import UIKit
    public typealias Color = UIColor
#else
    import Cocoa
    public typealias Color = NSColor
#endif

extension Color {
    public var expectationResult: Bool { return self == .green ? true : false }
}

extension Bool {
    public var expectationResult: Color { return self ? .green : .red }
}

public typealias ExpectationResult = Color
