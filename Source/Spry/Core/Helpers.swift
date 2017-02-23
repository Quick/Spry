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

public protocol ConvertibleToDouble {
    var doubleValue: CDouble { get }
}

extension Double : ConvertibleToDouble {
    public var doubleValue: CDouble {
        return self
    }
}

extension Float : ConvertibleToDouble {
    public var doubleValue: CDouble {
        return CDouble(self)
    }
}

extension CGFloat: ConvertibleToDouble {
    public var doubleValue: CDouble {
        return CDouble(self)
    }
}

extension NSNumber : ConvertibleToDouble { }

extension Date: ConvertibleToDouble {
    public var doubleValue: CDouble {
        return self.timeIntervalSinceReferenceDate
    }
}

extension NSDate: ConvertibleToDouble {
    public var doubleValue: CDouble {
        return self.timeIntervalSinceReferenceDate
    }
}

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
