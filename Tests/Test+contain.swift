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
        XCTAssert(expect([1, 2, 3]).to(contain(1)).expectationResult)
        XCTAssert(expect([1, 2, 3] as [CInt]).to(contain(1 as CInt)).expectationResult)
        XCTAssert(expect([1, 2, 3] as [CInt]).toNot(contain(4 as CInt)).expectationResult)
        XCTAssert(expect(["foo", "bar", "baz"]).to(contain("baz")).expectationResult)
        XCTAssert(expect([1, 2, 3]).toNot(contain(4)).expectationResult)
        XCTAssert(expect(["foo", "bar", "baz"]).toNot(contain("ba")).expectationResult)
    }
    
    func testContainSubstring() {
        XCTAssert(expect("foo").to(contain("o")).expectationResult)
        XCTAssert(expect("foo").to(contain("oo")).expectationResult)
        XCTAssert(expect("foo").toNot(contain("z")).expectationResult)
        XCTAssert(expect("foo").toNot(contain("zz")).expectationResult)
    }
    
    func testContainObjCSubstring() {
        let str = NSString(string: "foo")
        XCTAssert(expect(str).to(contain(NSString(string: "o"))).expectationResult)
        XCTAssert(expect(str).to(contain(NSString(string: "oo"))).expectationResult)
        XCTAssert(expect(str).toNot(contain(NSString(string: "z"))).expectationResult)
        XCTAssert(expect(str).toNot(contain(NSString(string: "zz"))).expectationResult)
    }
    
    func testVariadicArguments() {
        XCTAssert(expect([1, 2, 3]).to(contain(1, 2)).expectationResult)
        XCTAssert(expect([1, 2, 3]).toNot(contain(1, 4)).expectationResult)
    }
    
    func testCollectionArguments() {
        XCTAssert(expect([1, 2, 3]).to(contain([1, 2])).expectationResult)
        XCTAssert(expect([1, 2, 3]).toNot(contain([1, 4])).expectationResult)
        
        let collection = Array(1...10)
        let slice = Array(collection[3...5])
        XCTAssert(expect(collection).to(contain(slice)).expectationResult)
    }
    
}
