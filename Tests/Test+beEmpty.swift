//
//  Test+beEmpty.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beEmpty: XCTestCase {
    
    func testBeEmptyPositive() {
        XCTAssert(expect([] as [Int]).to(beEmpty()).expectationResult)
        XCTAssert(expect([1]).toNot(beEmpty()).expectationResult)
        
        XCTAssert(expect([] as [CInt]).to(beEmpty()).expectationResult)
        XCTAssert(expect([1] as [CInt]).toNot(beEmpty()).expectationResult)
        
        XCTAssert(expect([Int: Int]()).to(beEmpty()).expectationResult)
        XCTAssert(expect(["hi": 1]).toNot(beEmpty()).expectationResult)
        
        XCTAssert(expect(NSSet()).to(beEmpty()).expectationResult)
        XCTAssert(expect(NSSet(array: [NSNumber(value: 1)])).toNot(beEmpty()).expectationResult)
        
        XCTAssert(expect(NSIndexSet()).to(beEmpty()).expectationResult)
        XCTAssert(expect(NSIndexSet(index: 1)).toNot(beEmpty()).expectationResult)
        
        XCTAssert(expect(NSString()).to(beEmpty()).expectationResult)
        XCTAssert(expect(NSString(string: "hello")).toNot(beEmpty()).expectationResult)
        
        XCTAssert(expect("").to(beEmpty()).expectationResult)
        XCTAssert(expect("foo").toNot(beEmpty()).expectationResult)
    }
    
}
