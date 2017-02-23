//
//  ConvertibleToDouble.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import Foundation
import CoreGraphics

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
