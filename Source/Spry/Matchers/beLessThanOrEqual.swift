import Foundation

/// A Nimble matcher that succeeds when the actual value is less than
/// or equal to the expected value.
public func beLessThanOrEqualTo<T: Comparable>(_ expectedValue: T?) -> Matcher<T> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate(), let expected = expectedValue {
            return actual <= expected
        }
        return false
    }
}

/// A Nimble matcher that succeeds when the actual value is less than
/// or equal to the expected value.
@discardableResult
public func <=<T: Comparable>(lhs: Expectation<T>, rhs: T) -> Bool {
    return lhs.to(beLessThanOrEqualTo(rhs))
}
