//
//  Test+beVoid.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beVoid: XCTestCase {
    
    func testBeVoid() {
        XCTAssert(expect(()).to(beVoid()).expectationResult)
        XCTAssert(expect(() as ()?).to(beVoid()).expectationResult)
        XCTAssert(expect(nil as ()?).toNot(beVoid()).expectationResult)
        
        XCTAssert((expect(()) == ()).expectationResult)
        XCTAssert((expect(() as ()?) == ()).expectationResult)
        XCTAssert((expect(nil as ()?) != ()).expectationResult)
    }
    
}
