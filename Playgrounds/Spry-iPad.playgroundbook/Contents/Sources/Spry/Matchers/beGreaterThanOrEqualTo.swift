import Foundation

/// A Nimble matcher that succeeds when the actual value is greater than
/// or equal to the expected value.
public func beGreaterThanOrEqualTo<T: Comparable>(_ expectedValue: T?) -> Matcher<T> {
    return Matcher { actualExpression in
        let actualValue = try actualExpression.evaluate()
        if let actual = actualValue, let expected = expectedValue {
            return actual >= expected
        }
        return false
    }
}

/// A Nimble matcher that succeeds when the actual value is greater than
/// or equal to the expected value.
@discardableResult
public func >=<T: Comparable>(lhs: Expectation<T>, rhs: T) -> Bool {
    return lhs.to(beGreaterThanOrEqualTo(rhs))
}
