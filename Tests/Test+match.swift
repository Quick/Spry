//
//  Test+match.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_match: XCTestCase {
    
    func testMatchPositive() {
        XCTAssert(expect("11:14").to(match("\\d{2}:\\d{2}")).expectationResult)
    }
    
    func testMatchNegative() {
        XCTAssert(expect("hello").toNot(match("\\d{2}:\\d{2}")).expectationResult)
    }
}
