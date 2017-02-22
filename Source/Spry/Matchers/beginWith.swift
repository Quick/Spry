import Foundation

/// A Nimble matcher that succeeds when the actual sequence's first element
/// is equal to the expected value.
public func beginWith<S: Sequence, T: Equatable>(_ startingElement: T) -> Matcher<S>
    where S.Iterator.Element == T {
        return Matcher { actualExpression in
            if let actualValue = try actualExpression.evaluate() {
                var actualGenerator = actualValue.makeIterator()
                return actualGenerator.next() == startingElement
            }
            return false
        }
}


/// A Nimble matcher that succeeds when the actual string contains expected substring
/// where the expected substring's location is zero.
public func beginWith(_ startingSubstring: String) -> Matcher<String> {
    return Matcher { actualExpression in
        if let actual = try actualExpression.evaluate() {
            let range = actual.range(of: startingSubstring)
            return range != nil && range!.lowerBound == actual.startIndex
        }
        return false
    }
}
