//
//  Test+endWIth.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_endWIth: XCTestCase {
    
    func testEndWithPositives() {
        XCTAssert(expect([1, 2, 3]).to(endWith(3)))
        XCTAssert(expect([1, 2, 3]).toNot(endWith(2)))
        XCTAssert(expect([]).toNot(endWith(1)))
        XCTAssert(expect(["a", "b", "a"]).to(endWith("a")))
        
        XCTAssert(expect("foobar").to(endWith("bar")))
        XCTAssert(expect("foobar").toNot(endWith("oo")))
        XCTAssert(expect("foobarfoo").to(endWith("foo")))
        
        XCTAssert(expect(NSString(string: "foobar").description).to(endWith("bar")))
        XCTAssert(expect(NSString(string: "foobar").description).toNot(endWith("oo")))
    }
    
}
