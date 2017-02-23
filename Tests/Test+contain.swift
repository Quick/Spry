//
//  Test+contain.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_contain: XCTestCase {
    
    func testContain() {
        XCTAssert(expect([1, 2, 3]).to(contain(1)))
        XCTAssert(expect([1, 2, 3] as [CInt]).to(contain(1 as CInt)))
        XCTAssert(expect([1, 2, 3] as [CInt]).toNot(contain(4 as CInt)))
        XCTAssert(expect(["foo", "bar", "baz"]).to(contain("baz")))
        XCTAssert(expect([1, 2, 3]).toNot(contain(4)))
        XCTAssert(expect(["foo", "bar", "baz"]).toNot(contain("ba")))
    }
    
    func testContainSubstring() {
        XCTAssert(expect("foo").to(contain("o")))
        XCTAssert(expect("foo").to(contain("oo")))
        XCTAssert(expect("foo").toNot(contain("z")))
        XCTAssert(expect("foo").toNot(contain("zz")))
    }
    
    func testContainObjCSubstring() {
        let str = NSString(string: "foo")
        XCTAssert(expect(str).to(contain(NSString(string: "o"))))
        XCTAssert(expect(str).to(contain(NSString(string: "oo"))))
        XCTAssert(expect(str).toNot(contain(NSString(string: "z"))))
        XCTAssert(expect(str).toNot(contain(NSString(string: "zz"))))
    }
    
    func testVariadicArguments() {
        XCTAssert(expect([1, 2, 3]).to(contain(1, 2)))
        XCTAssert(expect([1, 2, 3]).toNot(contain(1, 4)))
    }
    
    func testCollectionArguments() {
        XCTAssert(expect([1, 2, 3]).to(contain([1, 2])))
        XCTAssert(expect([1, 2, 3]).toNot(contain([1, 4])))
        
        let collection = Array(1...10)
        let slice = Array(collection[3...5])
        XCTAssert(expect(collection).to(contain(slice)))
    }
    
}
