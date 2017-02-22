import Foundation

#if os(iOS)
import UIKit
public typealias ExpectationResultColor = UIColor
#else
import Cocoa
public typealias ExpectationResultColor = NSColor
#endif

extension Bool {
    var color: ExpectationResultColor {
        return self ? .green : .red
    }
}

func expressionMatches<T, U>(_ expression: Expression<T>, matcher: U) -> Bool
    where U: Matcher, U.ValueType == T {
    do {
        let pass = try matcher.matches(expression)
        return pass
    } catch {
        return false
    }
}

func expressionDoesNotMatch<T, U>(_ expression: Expression<T>, matcher: U) -> Bool
    where U: Matcher, U.ValueType == T {
    do {
        let pass = try matcher.doesNotMatch(expression)
        return pass
    } catch {
        return false
    }
}

public struct Expectation<T> {
    let expression: Expression<T>
    public func to<U>(_ matcher: U) -> ExpectationResultColor
        where U: Matcher, U.ValueType == T {
        return expressionMatches(expression, matcher: matcher).color
    }
    
    public func toNot<U>(_ matcher: U) -> ExpectationResultColor
        where U: Matcher, U.ValueType == T {
        return expressionDoesNotMatch(expression, matcher: matcher).color
    }
}
