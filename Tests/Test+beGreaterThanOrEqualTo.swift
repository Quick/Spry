//
//  Test+beGreaterThanOrEqualTo.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beGreaterThanOrEqualTo: XCTestCase {
    
    func testGreaterThanOrEqualTo() {
        XCTAssert(expect(10).to(beGreaterThanOrEqualTo(10)))
        XCTAssert(expect(10).to(beGreaterThanOrEqualTo(2)))
        XCTAssert(expect(1).toNot(beGreaterThanOrEqualTo(2)))
        XCTAssert(expect(NSNumber(value:1)).toNot(beGreaterThanOrEqualTo(2)))
        XCTAssert(expect(NSNumber(value:2)).to(beGreaterThanOrEqualTo(NSNumber(value:2))))
        XCTAssert(expect(1).to(beGreaterThanOrEqualTo(NSNumber(value:0))))
    }
    
    func testGreaterThanOrEqualToOperator() {
        XCTAssert(expect(0) >= 0)
        XCTAssert(expect(1) >= 0)
        XCTAssert(expect(NSNumber(value:1)) >= 1)
        XCTAssert(expect(NSNumber(value:1)) >= NSNumber(value:1))
    }
    
}
