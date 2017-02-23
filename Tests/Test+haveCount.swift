//
//  Test+haveCount.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_haveCount: XCTestCase {
    
    func testHaveCountForArray() {
        XCTAssert(expect([1, 2, 3]).to(haveCount(3)))
        XCTAssert(expect([1, 2, 3]).toNot(haveCount(1)))
    }
    
    func testHaveCountForDictionary() {
        let dictionary = ["1": 1, "2": 2, "3": 3]
        XCTAssert(expect(dictionary).to(haveCount(3)))
        XCTAssert(expect(dictionary).toNot(haveCount(1)))
    }
    
    func testHaveCountForSet() {
        let set = Set([1, 2, 3])
        XCTAssert(expect(set).to(haveCount(3)))
        XCTAssert(expect(set).toNot(haveCount(1)))
    }
    
}
