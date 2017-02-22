import Foundation

public func equal<T: Equatable>(_ expectedValue: T?) -> MatcherFunc<T> {
    return MatcherFunc { expression in
        let value = try expression.evaluate()
        let matches = value == expectedValue && expectedValue != nil
        
        if expectedValue == nil || value == nil {
            return false
        }
        
        return matches
    }
}
