//
//  EqualTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

public struct Matcher<T> {
    let matcher: (Expression<T>) throws -> Bool
    
    init(_ matcher: @escaping (Expression<T>) throws -> Bool) {
        self.matcher = matcher
    }
    
    func evaluate(_ expression: Expression<T>) throws -> Bool {
        return try matcher(expression)
    }
}
