//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

private enum MatchResult {
    case success
    case failure
}

public struct Matcher<T> {
    public let matcher: (Expression<T>) throws -> Bool
    
    init(_ matcher: @escaping (Expression<T>) throws -> Bool) {
        self.matcher = matcher
    }
    
    public func evaluate(_ expression: Expression<T>) throws -> Bool {
        return try matcher(expression)
    }
}
