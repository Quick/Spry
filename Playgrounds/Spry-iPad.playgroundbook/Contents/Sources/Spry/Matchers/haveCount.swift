import Foundation

// The `haveCount` matchers do not print the full string representation of the collection value,
// instead they only print the type name and the expected count. This makes it easier to understand
// the reason for failed expectations. See: https://github.com/Quick/Nimble/issues/308.
// The representation of the collection content is provided in a new line as an `extendedMessage`.

/// A Nimble matcher that succeeds when the actual Collection's count equals
/// the expected value
public func haveCount<T: Collection>(_ expectedValue: T.IndexDistance) -> Matcher<T> {
    return Matcher { actualExpression in
        if let actualValue = try actualExpression.evaluate() {
            let result = expectedValue == actualValue.count
            return result
        } else {
            return false
        }
    }
}
