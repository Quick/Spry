//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import XCTest
@testable import Spry

class EqualTests: XCTestCase {

    func testPositive() {
        let result = expect("Shaps").to(equal("Shaps"))
        XCTAssertEqual(result, true)
    }
    
    func testNegative() {
        let result = expect("Shaps").toNot(equal("Mohsenin"))
        XCTAssertEqual(result, true)
    }

}
