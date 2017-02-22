//
//  Matcher+beEmpty.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import Foundation

/// A Nimble matcher that succeeds when a value is "empty". For collections, this
/// means the are no items in that collection. For strings, it is an empty string.
public func beEmpty<S: Sequence>() -> Matcher<S> {
    return Matcher { actualExpression in
                let actualSeq = try actualExpression.evaluate()
        if actualSeq == nil {
            return true
        }
        var generator = actualSeq!.makeIterator()
        return generator.next() == nil
    }
}

/// A Nimble matcher that succeeds when a value is "empty". For collections, this
/// means the are no items in that collection. For strings, it is an empty string.
public func beEmpty() -> Matcher<String> {
    return Matcher { actualExpression in
                let actualString = try actualExpression.evaluate()
        return actualString == nil || NSString(string: actualString!).length  == 0
    }
}

/// A Nimble matcher that succeeds when a value is "empty". For collections, this
/// means the are no items in that collection. For NSString instances, it is an empty string.
public func beEmpty() -> Matcher<NSString> {
    return Matcher { actualExpression in
                let actualString = try actualExpression.evaluate()
        return actualString == nil || actualString!.length == 0
    }
}

// Without specific overrides, beEmpty() is ambiguous for NSDictionary, NSArray,
// etc, since they conform to Sequence as well as NMBCollection.

/// A Nimble matcher that succeeds when a value is "empty". For collections, this
/// means the are no items in that collection. For strings, it is an empty string.
public func beEmpty() -> Matcher<NSDictionary> {
    return Matcher { actualExpression in
                let actualDictionary = try actualExpression.evaluate()
        return actualDictionary == nil || actualDictionary!.count == 0
    }
}

/// A Nimble matcher that succeeds when a value is "empty". For collections, this
/// means the are no items in that collection. For strings, it is an empty string.
public func beEmpty() -> Matcher<NSArray> {
    return Matcher { actualExpression in
                let actualArray = try actualExpression.evaluate()
        return actualArray == nil || actualArray!.count == 0
    }
}
