//
//  Matcher+beAnInstanceOf.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

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

public func beAnInstanceOf(_ expectedClass: AnyClass) -> Matcher<NSObject> {
    return Matcher { expression in
        let instance = try expression.evaluate()
        return instance != nil && type(of: instance!) == expectedClass
    }
}
