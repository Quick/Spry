//
//  Test+beLessThanOrEqualTo.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beLessThanOrEqualTo: XCTestCase {
    
    func testLessThanOrEqualTo() {
        XCTAssert(expect(10).to(beLessThanOrEqualTo(10)))
        XCTAssert(expect(2).to(beLessThanOrEqualTo(10)))
        XCTAssert(expect(2).toNot(beLessThanOrEqualTo(1)))
        
        XCTAssert(expect(NSNumber(value:2)).to(beLessThanOrEqualTo(10)))
        XCTAssert(expect(NSNumber(value:2)).toNot(beLessThanOrEqualTo(1)))
        XCTAssert(expect(2).to(beLessThanOrEqualTo(NSNumber(value:10))))
        XCTAssert(expect(2).toNot(beLessThanOrEqualTo(NSNumber(value:1))))
    }
    
    func testLessThanOrEqualToOperator() {
        XCTAssert(expect(0) <= 1)
        XCTAssert(expect(1) <= 1)
    }
    
}
