import Foundation

/// A Nimble matcher that succeeds when the actual value is the same instance
/// as the expected instance.
public func beIdenticalTo(_ expected: Any?) -> Matcher<Any> {
    return Matcher { actualExpression in
        let actual = try actualExpression.evaluate() as AnyObject?
        return actual === (expected as AnyObject?) && actual !== nil
    }
}

public func === (lhs: Expectation<Any>, rhs: Any?) {
    lhs.to(beIdenticalTo(rhs))
}
public func !== (lhs: Expectation<Any>, rhs: Any?) {
    lhs.toNot(beIdenticalTo(rhs))
}

/// A Nimble matcher that succeeds when the actual value is the same instance
/// as the expected instance.
///
/// Alias for "beIdenticalTo".
public func be(_ expected: Any?) -> Matcher<Any> {
    return beIdenticalTo(expected)
}
