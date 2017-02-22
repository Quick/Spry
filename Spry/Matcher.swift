import Foundation

public protocol Matcher {
    associatedtype ValueType
    func matches(_ expression: Expression<ValueType>) throws -> Bool
    func doesNotMatch(_ expression: Expression<ValueType>) throws -> Bool
}

public struct MatcherFunc<T>: Matcher {
    public let matcher: (Expression<T>) throws -> Bool
    
    init(_ matcher: @escaping (Expression<T>) throws -> Bool) {
        self.matcher = matcher
    }
    
    public func matches(_ expression: Expression<T>) throws -> Bool {
        return try matcher(expression)
    }
    
    public func doesNotMatch(_ expression: Expression<T>) throws -> Bool {
        return try !matcher(expression)
    }
}
