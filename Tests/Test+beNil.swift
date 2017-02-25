//
//  BeNilTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import XCTest
@testable import Spry

final class Test_beNil: XCTestCase {
    
    func testBeNil() {
        XCTAssert(expect(nil as Int?).to(beNil()).expectationResult)
        XCTAssert(expect(1 as Int?).toNot(beNil()).expectationResult)
    }
    
    func testBeNilWithEqualityOperator() {
        XCTAssert(expect(nil as Float?).to(beNil()).expectationResult)
        XCTAssert((expect(nil as Float?) == nil).expectationResult)
        XCTAssert((expect(20 as Int?) != nil).expectationResult)
    }
    
}
