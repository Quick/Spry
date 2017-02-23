//
//  Test+beLessThan.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beLessThan: XCTestCase {
    
    func testLessThan() {
        XCTAssert(expect(2).to(beLessThan(10)))
        XCTAssert(expect(2).toNot(beLessThan(1)))
        XCTAssert(expect(NSNumber(value:2)).to(beLessThan(10)))
        XCTAssert(expect(NSNumber(value:2)).toNot(beLessThan(1)))
        
        XCTAssert(expect(2).to(beLessThan(NSNumber(value:10))))
        XCTAssert(expect(2).toNot(beLessThan(NSNumber(value:1))))
    }
    
    func testLessThanOperator() {
        XCTAssert(expect(0) < 1)
        XCTAssert(expect(NSNumber(value:0)) < 1)
    }
    
}
