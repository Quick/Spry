//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

public struct Expectation<T> {
    
    let expression: Expression<T>
    
    public func to(_ matcher: Matcher<T>) -> Bool {
        return evaluate(matcher: matcher)
    }
    
    public func toNot(_ matcher: Matcher<T>) -> Bool {
        return !evaluate(matcher: matcher)
    }
    
    private func evaluate(matcher: Matcher<T>) -> Bool {
        do {
            let result = try matcher.evaluate(expression)
            return result
        } catch { return false }
    }
    
}
