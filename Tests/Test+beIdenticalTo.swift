//
//  Test+beIdenticalTo.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beIdenticalTo: XCTestCase {
    
    func testBeIdenticalToPositive() {
        let value = NSDate()
        XCTAssert(expect(value).to(beIdenticalTo(value)).expectationResult)
    }
    
    func testBeIdenticalToNegative() {
        XCTAssert(expect(NSNumber(value:1)).toNot(beIdenticalTo(NSString(string: "yo"))).expectationResult)
        XCTAssert(expect(NSArray(array: [NSNumber(value: 1)])).toNot(beIdenticalTo(NSArray(array: [NSNumber(value: 1)]))).expectationResult)
    }
    
    func testOperators() {
        let value = NSDate()
        XCTAssert((expect(value) === value).expectationResult)
        XCTAssert((expect(NSNumber(value:1)) !== NSNumber(value:2)).expectationResult)
    }
    
    func testBeAlias() {
        let value = NSDate()
        XCTAssert(expect(value).to(be(value)).expectationResult)
        XCTAssert(expect(NSNumber(value:1)).toNot(be(NSString(string: "turtles"))).expectationResult)
        XCTAssert(expect([1]).toNot(be([1])).expectationResult)
        XCTAssert(expect(NSArray(array: [NSNumber(value: 1)])).toNot(beIdenticalTo(NSArray(array: [NSNumber(value: 1)]))).expectationResult)
    }
    
}
