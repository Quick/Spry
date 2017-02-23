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
        XCTAssert(expect([] as [Int]).to(beEmpty()))
        XCTAssert(expect([1]).toNot(beEmpty()))
        
        XCTAssert(expect([] as [CInt]).to(beEmpty()))
        XCTAssert(expect([1] as [CInt]).toNot(beEmpty()))
        
        XCTAssert(expect([Int: Int]()).to(beEmpty()))
        XCTAssert(expect(["hi": 1]).toNot(beEmpty()))
        
        XCTAssert(expect(NSSet()).to(beEmpty()))
        XCTAssert(expect(NSSet(array: [NSNumber(value: 1)])).toNot(beEmpty()))
        
        XCTAssert(expect(NSIndexSet()).to(beEmpty()))
        XCTAssert(expect(NSIndexSet(index: 1)).toNot(beEmpty()))
        
        XCTAssert(expect(NSString()).to(beEmpty()))
        XCTAssert(expect(NSString(string: "hello")).toNot(beEmpty()))
        
        XCTAssert(expect("").to(beEmpty()))
        XCTAssert(expect("foo").toNot(beEmpty()))
    }
    
}
