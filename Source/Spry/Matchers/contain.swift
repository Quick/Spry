import Foundation

/// A Nimble matcher that succeeds when the actual sequence contains the expected value.
public func contain<S: Sequence, T: Equatable>(_ items: T...) -> Matcher<S>
    where S.Iterator.Element == T {
        return contain(items)
}

public func contain<S: Sequence, T: Equatable>(_ items: [T]) -> Matcher<S>
    where S.Iterator.Element == T {
        return Matcher { actualExpression in
            if let actual = try actualExpression.evaluate() {
                return items.all {
                    return actual.contains($0)
                }
            }
            return false
        }
}

/// A Nimble matcher that succeeds when the actual string contains the expected substring.
public func contain(_ substrings: String...) -> Matcher<String> {
    return contain(substrings)
}

public func contain(_ substrings: [String]) -> Matcher<String> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate() {
            return substrings.all {
                let range = actual.range(of: $0)
                return range != nil && !range!.isEmpty
            }
        }
        return false
    }
}

/// A Nimble matcher that succeeds when the actual string contains the expected substring.
public func contain(_ substrings: NSString...) -> Matcher<NSString> {
    return contain(substrings)
}

public func contain(_ substrings: [NSString]) -> Matcher<NSString> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate() {
            return substrings.all { actual.range(of: $0.description).length != 0 }
        }
        return false
    }
}
