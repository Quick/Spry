//
//  Helpers.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation

extension Sequence {
    func all(_ fn: (Iterator.Element) -> Bool) -> Bool {
        for item in self {
            if !fn(item) {
                return false
            }
        }
        
        return true
    }
}
