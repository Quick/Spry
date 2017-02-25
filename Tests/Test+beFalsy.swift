//
//  Test+beFalsy.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beFalsy: XCTestCase {
    
    func testShouldMatchNilTypes() {
        XCTAssert(expect(false as Bool?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Bool?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Int8?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as UInt8?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Int16?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as UInt16?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Int32?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as UInt32?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Int64?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as UInt64?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Float?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Double?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as Int?).to(beFalsy()).expectationResult)
        XCTAssert(expect(nil as UInt?).to(beFalsy()).expectationResult)
    }
    
    func testShouldNotMatchTrue() {
        XCTAssert(expect(true).toNot(beFalsy()).expectationResult)
    }
    
    func testShouldNotMatchNonNilTypes() {
        XCTAssert(expect(true as Bool?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Int8?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as UInt8?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Int16?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as UInt16?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Int32?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as UInt32?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Int64?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as UInt64?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Float?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Double?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as Int?).toNot(beFalsy()).expectationResult)
        XCTAssert(expect(1 as UInt?).toNot(beFalsy()).expectationResult)
    }
    
    func testShouldMatchFalse() {
        XCTAssert(expect(false).to(beFalsy()).expectationResult)
    }
    
    func testShouldMatchNilBools() {
        XCTAssert(expect(nil as Bool?).to(beFalsy()).expectationResult)
    }
    
}
