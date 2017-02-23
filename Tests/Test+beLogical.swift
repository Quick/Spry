//
//  Test+beLogical.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import Spry

enum ConvertsToBool: ExpressibleByBooleanLiteral {
    case trueLike, falseLike
    
    typealias BooleanLiteralType = Bool
    
    init(booleanLiteral value: Bool) {
        switch value {
        case true: self = .trueLike
        case false: self = .falseLike
        }
    }
    
    var boolValue: Bool {
        switch self {
        case .trueLike: return true
        case .falseLike: return false
        }
    }
}
