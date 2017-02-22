//
//  Helpers.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation
@testable import Spry

extension ExpectationResultColor {
    var bool: Bool {
        return self == .green ? true : false
    }
}
