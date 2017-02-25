//
//  Test+beFalse.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beFalse: XCTestCase {
    
    func testShouldNotMatchTrue() {
        XCTAssert(expect(true).toNot(beFalse()).expectationResult)
    }
    
    func testShouldMatchFalse() {
        XCTAssert(expect(false).to(beFalse()).expectationResult)
    }
    
}
