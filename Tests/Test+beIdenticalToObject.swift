//
//  Test+beIdenticalToObject.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

class Test_beIdenticalToObject: XCTestCase {
    
    private class BeIdenticalToObjectTester {}
    private let testObjectA = BeIdenticalToObjectTester()
    private let testObjectB = BeIdenticalToObjectTester()
    
    func testBeIdenticalToPositive() {
        XCTAssert(expect(self.testObjectA).to(beIdenticalTo(testObjectA)))
    }
    
    func testBeIdenticalToNegative() {
        XCTAssert(expect(self.testObjectA).toNot(beIdenticalTo(testObjectB)))
    }
    
    func testOperators() {
        XCTAssert(expect(self.testObjectA) === testObjectA)
        XCTAssert(expect(self.testObjectA) !== testObjectB)
    }
    
}
