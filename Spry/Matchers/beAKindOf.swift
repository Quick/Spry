//
//  Matcher+beAKindOf.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

public func beAKindOf<T>(_ expectedType: T.Type) -> Matcher<Any> {
    return Matcher { expression in
        let instance = try expression.evaluate()
        
        guard let validInstance = instance, validInstance is T else {
            return false
        }
        
        return true
    }
}
