//
//  BeNilTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import XCTest
@testable import Spry

final class BeNilTests: XCTestCase {
    
    func testBeNil() {
        XCTAssert(expect(nil as Int?).to(beNil()))
        XCTAssert(expect(1 as Int?).toNot(beNil()))
    }
    
    func testBeNilWithEqualityOperator() {
        XCTAssert(expect(nil as Float?).to(beNil()))
        XCTAssert(expect(nil as Float?) == nil)
        XCTAssert(expect(20 as Int?) != nil)
    }
    
}
