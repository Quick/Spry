//
//  Test+beGreaterThan.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beGreaterThan: XCTestCase {
    
    func testGreaterThan() {
        XCTAssert(expect(10).to(beGreaterThan(2)))
        XCTAssert(expect(1).toNot(beGreaterThan(2)))
        XCTAssert(expect(NSNumber(value:3)).to(beGreaterThan(2)))
        XCTAssert(expect(NSNumber(value:1)).toNot(beGreaterThan(NSNumber(value:2))))
    }
    
    func testGreaterThanOperator() {
        XCTAssert(expect(1) > 0)
        XCTAssert(expect(NSNumber(value:1)) > NSNumber(value:0))
        XCTAssert(expect(NSNumber(value:1)) > 0)
    }
    
}
