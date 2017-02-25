//
//  Test+satisfyAnyOf.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_satisfyAnyOf: XCTestCase {
    
    func testSatisfyAnyOf() {
        XCTAssert(expect(2).to(satisfyAnyOf(equal(2), equal(3))).expectationResult)
        XCTAssert(expect("turtle").toNot(satisfyAnyOf(contain("a"), endWith("magic"))).expectationResult)
        XCTAssert(expect(82.0).toNot(satisfyAnyOf(beLessThan(10.5), beGreaterThan(100.75), beCloseTo(50.1))).expectationResult)
        XCTAssert(expect(false).to(satisfyAnyOf(beTrue(), beFalse())).expectationResult)
        XCTAssert(expect(true).to(satisfyAnyOf(beTruthy(), beFalsy())).expectationResult)
    }
    
    func testOperatorOr() {
        XCTAssert(expect(2).to(equal(2) || equal(3)).expectationResult)
        XCTAssert(expect("turtle").toNot(contain("a") || endWith("magic")).expectationResult)
        XCTAssert(expect(82.0).toNot(beLessThan(10.5) || beGreaterThan(100.75)).expectationResult)
        XCTAssert(expect(false).to(beTrue() || beFalse()).expectationResult)
        XCTAssert(expect(true).to(beTruthy() || beFalsy()).expectationResult)
    }
    
}
