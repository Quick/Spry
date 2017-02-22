import Foundation

/// A Nimble matcher that succeeds when the actual sequence's last element
/// is equal to the expected value.
public func endWith<S: Sequence, T: Equatable>(_ endingElement: T) -> Matcher<S>
    where S.Iterator.Element == T {
        return Matcher { actualExpression in
            
            if let actualValue = try actualExpression.evaluate() {
                var actualGenerator = actualValue.makeIterator()
                var lastItem: T?
                var item: T?
                repeat {
                    lastItem = item
                    item = actualGenerator.next()
                } while(item != nil)
                
                return lastItem == endingElement
            }
            return false
        }
}

/// A Nimble matcher that succeeds when the actual string contains the expected substring
/// where the expected substring's location is the actual string's length minus the
/// expected substring's length.
public func endWith(_ endingSubstring: String) -> Matcher<String> {
    return Matcher { actualExpression in
        if let collection = try actualExpression.evaluate() {
            return collection.hasSuffix(endingSubstring)
        }
        return false
    }
}

