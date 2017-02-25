import Foundation

/// A Nimble matcher that succeeds when the actual value is less than the expected value.
public func beLessThan<T: Comparable>(_ expectedValue: T?) -> Matcher<T> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate(), let expected = expectedValue {
            return actual < expected
        }
        return false
    }
}

/// A Nimble matcher that succeeds when the actual value is less than the expected value.
@discardableResult
public func <<T: Comparable>(lhs: Expectation<T>, rhs: T) -> ExpectationResult {
    return lhs.to(beLessThan(rhs))
}
