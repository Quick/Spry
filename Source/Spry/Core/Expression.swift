//
//  EqualTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

public struct Expression<T> {
    let expression: () throws -> T?
    
    func evaluate() throws -> T? {
        return try self.expression()
    }
}
