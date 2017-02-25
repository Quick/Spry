//
//  Test+beginWith.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_beginWith: XCTestCase {
    
    func testPositiveMatches() {
        XCTAssert(expect([1, 2, 3]).to(beginWith(1)).expectationResult)
        XCTAssert(expect([1, 2, 3]).toNot(beginWith(2)).expectationResult)
        
        XCTAssert(expect("foobar").to(beginWith("foo")).expectationResult)
        XCTAssert(expect("foobar").toNot(beginWith("oo")).expectationResult)
        
        XCTAssert(expect("foobarfoo").to(beginWith("foo")).expectationResult)
        
        XCTAssert(expect(NSString(string: "foobar").description).to(beginWith("foo")).expectationResult)
        XCTAssert(expect(NSString(string: "foobar").description).toNot(beginWith("oo")).expectationResult)
    }
    
}
