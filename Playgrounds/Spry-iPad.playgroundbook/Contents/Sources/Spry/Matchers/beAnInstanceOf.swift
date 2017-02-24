//
//  Matcher+beAnInstanceOf.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

/// A Nimble matcher that succeeds when the actual value is an _exact_ instance of the given class.
public func beAnInstanceOf<T>(_ expectedType: T.Type) -> Matcher<Any> {
    return Matcher { expression in
        let instance = try expression.evaluate()
        
        guard let validInstance = instance else {
            return false
        }
        
        if type(of: validInstance) == expectedType {
            return true
        }
        
        return false
    }
}

/// A Nimble matcher that succeeds when the actual value is an instance of the given class.
/// @see beAKindOf if you want to match against subclasses
public func beAnInstanceOf(_ expectedClass: AnyClass) -> Matcher<NSObject> {
    return Matcher { expression in
        let instance = try expression.evaluate()
        return instance != nil && type(of: instance!) == expectedClass
    }
}
