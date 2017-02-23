import Foundation

/// A Nimble matcher that succeeds when the actual value is greater than the expected value.
public func beGreaterThan<T: Comparable>(_ expectedValue: T?) -> Matcher<T> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate(), let expected = expectedValue {
            return actual > expected
        }
        return false
    }
}

/// A Nimble matcher that succeeds when the actual value is greater than the expected value.
@discardableResult
public func ><T: Comparable>(lhs: Expectation<T>, rhs: T) -> Bool {
    return lhs.to(beGreaterThan(rhs))
}
