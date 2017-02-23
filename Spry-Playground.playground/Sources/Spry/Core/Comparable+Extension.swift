//
//  Comparable+Extension.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import Foundation

extension NSNumber : Comparable {
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <(lhs: NSNumber, rhs: NSNumber) -> Bool {
        return Double(lhs) < Double(rhs)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <=(lhs: NSNumber, rhs: NSNumber) -> Bool {
        return Double(lhs) <= Double(rhs)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func >=(lhs: NSNumber, rhs: NSNumber) -> Bool {
        return Double(lhs) >= Double(rhs)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func >(lhs: NSNumber, rhs: NSNumber) -> Bool {
        return Double(lhs) > Double(rhs)
    }
    
}

extension NSString : Comparable {
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <(lhs: NSString, rhs: NSString) -> Bool {
        return String(lhs) < String(rhs)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func <=(lhs: NSString, rhs: NSString) -> Bool {
        return String(lhs) <= String(rhs)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than or equal to that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func >=(lhs: NSString, rhs: NSString) -> Bool {
        return String(lhs) >= String(rhs)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is greater than that of the second argument.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func >(lhs: NSString, rhs: NSString) -> Bool {
        return String(lhs) > String(rhs)
    }
}
