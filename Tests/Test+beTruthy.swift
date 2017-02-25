//
//  Test+beTruthy.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beTruthy: XCTestCase {
    
    func testShouldMatchNonNilTypes() {
        XCTAssert(expect(true as Bool?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Int8?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as UInt8?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Int16?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as UInt16?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Int32?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as UInt32?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Int64?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as UInt64?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Float?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Double?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as Int?).to(beTruthy()).expectationResult)
        XCTAssert(expect(1 as UInt?).to(beTruthy()).expectationResult)
    }
    
    func testShouldMatchTrue() {
        XCTAssert(expect(true).to(beTruthy()).expectationResult)
    }
    
    func testShouldNotMatchNilTypes() {
        XCTAssert(expect(false as Bool?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Bool?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Int8?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as UInt8?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Int16?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as UInt16?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Int32?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as UInt32?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Int64?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as UInt64?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Float?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Double?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as Int?).toNot(beTruthy()).expectationResult)
        XCTAssert(expect(nil as UInt?).toNot(beTruthy()).expectationResult)
    }
    
    func testShouldNotMatchFalse() {
        XCTAssert(expect(false).toNot(beTruthy()).expectationResult)
    }
    
    func testShouldNotMatchNilBools() {
        XCTAssert(expect(nil as Bool?).toNot(beTruthy()).expectationResult)
    }
    
    func testShouldMatchBoolConvertibleTypesThatConvertToTrue() {
        XCTAssert(expect(ConvertsToBool.trueLike).to(beTruthy()).expectationResult)
    }
    
    func testShouldNotMatchBoolConvertibleTypesThatConvertToFalse() {
        XCTAssert(expect(ConvertsToBool.falseLike).toNot(beTruthy()).expectationResult)
    }
    
}
