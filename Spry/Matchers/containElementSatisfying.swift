import Foundation

public func containElementSatisfying<S: Sequence, T>(_ predicate: @escaping ((T) -> Bool)) -> Matcher<S> where S.Iterator.Element == T {
    return Matcher { actualExpression in
        if let sequence = try actualExpression.evaluate() {
            for object in sequence {
                if predicate(object) {
                    return true
                }
            }
            
            return false
        }
        
        return false
    }
}
