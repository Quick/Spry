//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

#if os(iOS)
    import UIKit
    public typealias Color = UIColor
#else
    import Cocoa
    public typealias Color = NSColor
#endif

public typealias MatchResultType = Color

extension Bool {
    var color: Color {
        return self ? .green : .red
    }
}

public func expect<T>(_ expression: (@autoclosure @escaping () throws -> T?)) -> Expectation<T> {
    return Expectation(expression: Expression(expression: expression))
}
