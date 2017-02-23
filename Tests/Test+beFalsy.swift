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
        XCTAssert(expect(false as Bool?).to(beFalsy()))
        XCTAssert(expect(nil as Bool?).to(beFalsy()))
        XCTAssert(expect(nil as Int8?).to(beFalsy()))
        XCTAssert(expect(nil as UInt8?).to(beFalsy()))
        XCTAssert(expect(nil as Int16?).to(beFalsy()))
        XCTAssert(expect(nil as UInt16?).to(beFalsy()))
        XCTAssert(expect(nil as Int32?).to(beFalsy()))
        XCTAssert(expect(nil as UInt32?).to(beFalsy()))
        XCTAssert(expect(nil as Int64?).to(beFalsy()))
        XCTAssert(expect(nil as UInt64?).to(beFalsy()))
        XCTAssert(expect(nil as Float?).to(beFalsy()))
        XCTAssert(expect(nil as Double?).to(beFalsy()))
        XCTAssert(expect(nil as Int?).to(beFalsy()))
        XCTAssert(expect(nil as UInt?).to(beFalsy()))
    }
    
    func testShouldNotMatchTrue() {
        XCTAssert(expect(true).toNot(beFalsy()))
    }
    
    func testShouldNotMatchNonNilTypes() {
        XCTAssert(expect(true as Bool?).toNot(beFalsy()))
        XCTAssert(expect(1 as Int8?).toNot(beFalsy()))
        XCTAssert(expect(1 as UInt8?).toNot(beFalsy()))
        XCTAssert(expect(1 as Int16?).toNot(beFalsy()))
        XCTAssert(expect(1 as UInt16?).toNot(beFalsy()))
        XCTAssert(expect(1 as Int32?).toNot(beFalsy()))
        XCTAssert(expect(1 as UInt32?).toNot(beFalsy()))
        XCTAssert(expect(1 as Int64?).toNot(beFalsy()))
        XCTAssert(expect(1 as UInt64?).toNot(beFalsy()))
        XCTAssert(expect(1 as Float?).toNot(beFalsy()))
        XCTAssert(expect(1 as Double?).toNot(beFalsy()))
        XCTAssert(expect(1 as Int?).toNot(beFalsy()))
        XCTAssert(expect(1 as UInt?).toNot(beFalsy()))
    }
    
    func testShouldMatchFalse() {
        XCTAssert(expect(false).to(beFalsy()))
    }
    
    func testShouldMatchNilBools() {
        XCTAssert(expect(nil as Bool?).to(beFalsy()))
    }
    
}
