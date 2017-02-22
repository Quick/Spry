import Foundation

public func expect<T>(_ expression: @autoclosure @escaping () throws -> T?) -> Expectation<T> {
    return Expectation(expression: Expression(expression: expression))
}
