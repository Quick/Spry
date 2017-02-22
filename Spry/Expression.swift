import Foundation

public struct Expression<T> {
    let expression: () throws -> T?
    
    public func evaluate() throws -> T? {
        return try self.expression()
    }
}
