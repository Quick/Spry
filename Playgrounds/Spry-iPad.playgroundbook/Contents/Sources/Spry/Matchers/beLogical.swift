import Foundation

extension Int8: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).int8Value
    }
}

extension UInt8: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).uint8Value
    }
}

extension Int16: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).int16Value
    }
}

extension UInt16: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).uint16Value
    }
}

extension Int32: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).int32Value
    }
}

extension UInt32: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).uint32Value
    }
}

extension Int64: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).int64Value
    }
}

extension UInt64: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).uint64Value
    }
}

extension Float: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).floatValue
    }
}

extension Double: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).doubleValue
    }
}

extension Int: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).intValue
    }
}

extension UInt: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = NSNumber(value: value).uintValue
    }
}

private func matcherWithFailureMessage<T>(_ matcher: Matcher<T>, postprocessor: @escaping () -> Void) -> Matcher<T> {
    return Matcher { actualExpression in
        defer { postprocessor() }
        return try matcher.matcher(actualExpression)
    }
}

// MARK: beTrue() / beFalse()

/// A Nimble matcher that succeeds when the actual value is exactly true.
/// This matcher will not match against nils.
public func beTrue() -> Matcher<Bool> {
    return matcherWithFailureMessage(equal(true)) { }
}

/// A Nimble matcher that succeeds when the actual value is exactly false.
/// This matcher will not match against nils.
public func beFalse() -> Matcher<Bool> {
    return matcherWithFailureMessage(equal(false)) { }
}

// MARK: beTruthy() / beFalsy()

/// A Nimble matcher that succeeds when the actual value is not logically false.
public func beTruthy<T: ExpressibleByBooleanLiteral & Equatable>() -> Matcher<T> {
    return Matcher { actualExpression in
        let actualValue = try actualExpression.evaluate()
        if let actualValue = actualValue {
            // FIXME: This is a workaround to SR-2290.
            // See:
            // - https://bugs.swift.org/browse/SR-2290
            // - https://github.com/norio-nomura/Nimble/pull/5#issuecomment-237835873
            if let number = actualValue as? NSNumber {
                return number.boolValue == true
            }
            
            return actualValue == (true as T)
        }
        return actualValue != nil
    }
}

/// A Nimble matcher that succeeds when the actual value is logically false.
/// This matcher will match against nils.
public func beFalsy<T: ExpressibleByBooleanLiteral & Equatable>() -> Matcher<T> {
    return Matcher { actualExpression in
        let actualValue = try actualExpression.evaluate()
        if let actualValue = actualValue {
            // FIXME: This is a workaround to SR-2290.
            // See:
            // - https://bugs.swift.org/browse/SR-2290
            // - https://github.com/norio-nomura/Nimble/pull/5#issuecomment-237835873
            if let number = actualValue as? NSNumber {
                return number.boolValue == false
            }
            
            return actualValue == (false as T)
        }
        return actualValue == nil
    }
}
