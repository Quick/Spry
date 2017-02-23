//
//  Test+beTrue.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beTrue: XCTestCase {
    
    func testShouldMatchTrue() {
        XCTAssert(expect(true).to(beTrue()))
    }
    
    func testShouldNotMatchFalse() {
        XCTAssert(expect(false).toNot(beTrue()))
    }
    
}
