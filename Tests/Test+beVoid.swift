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
        XCTAssert(expect(()).to(beVoid()))
        XCTAssert(expect(() as ()?).to(beVoid()))
        XCTAssert(expect(nil as ()?).toNot(beVoid()))
        
        XCTAssert(expect(()) == ())
        XCTAssert(expect(() as ()?) == ())
        XCTAssert(expect(nil as ()?) != ())
    }
    
}
