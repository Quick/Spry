//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

public func equal<T: Equatable>(_ expectedValue: T) -> Matcher<T> {
    return Matcher { expression in
        let actualValue = try expression.evaluate()
        return actualValue == expectedValue
    }
}
