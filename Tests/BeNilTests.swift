//
//  BeNilTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import XCTest
@testable import Spry

class BeNilTests: XCTestCase {
    
    func testPositive() {
        let string: String? = nil
        let exp = expect(string)
        
        XCTAssertEqual(exp == nil, true)
        XCTAssertEqual(exp.to(beNil()), true)
    }
    
    func testNegative() {
        let string: String? = "Shaps"
        let exp = expect(string)
        
        XCTAssertEqual(exp != nil, true)
        XCTAssertEqual(exp.toNot(beNil()), true)
    }
    
}
