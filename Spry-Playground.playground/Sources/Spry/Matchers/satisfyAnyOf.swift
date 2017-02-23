import Foundation

/// A Nimble matcher that succeeds when the actual value matches with any of the matchers
/// provided in the variable list of matchers.
public func satisfyAnyOf<T>(_ matchers: Matcher<T>...) -> Matcher<T> {
    return satisfyAnyOf(matchers)
}

internal func satisfyAnyOf<T>(_ matchers: [Matcher<T>]) -> Matcher<T> {
    return Matcher<T> { actualExpression in
        let matches = false
        
        for matcher in matchers {
            if try matcher.evaluate(actualExpression) {
                return true
            }
        }
        
        _ = try actualExpression.evaluate()
        return matches
    }
}

public func || <T>(lhs: Matcher<T>, rhs: Matcher<T>) -> Matcher<T> {
    return satisfyAnyOf(lhs, rhs)
}
