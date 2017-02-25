import Foundation

/// A Nimble matcher that succeeds when the actual value is Void.
public func beVoid() -> Matcher<()> {
    return Matcher { actualExpression in
        let actualValue: ()? = try actualExpression.evaluate()
        return actualValue != nil
    }
}

/// A Nimble matcher that succeeds when the actual value is Void.
public func == (lhs: Expectation<()>, rhs: ()) -> ExpectationResult {
    return lhs.to(beVoid())
}

/// A Nimble matcher that succeeds when the actual value is not Void.
public func != (lhs: Expectation<()>, rhs: ()) -> ExpectationResult {
    return lhs.toNot(beVoid())
}
