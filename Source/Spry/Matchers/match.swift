import Foundation

/// A Nimble matcher that succeeds when the actual string satisfies the regular expression
/// described by the expected string.
public func match(_ expectedValue: String?) -> Matcher<String> {
    return Matcher { actualExpression in
        
        if let actual = try actualExpression.evaluate() {
            if let regexp = expectedValue {
                return actual.range(of: regexp, options: .regularExpression) != nil
            }
        }
        
        return false
    }
}
