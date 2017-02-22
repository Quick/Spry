//
//  BeAKindOfTests.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import XCTest
import Spry

fileprivate class TestNull: NSNull {}
fileprivate protocol TestProtocol {}
fileprivate class TestClassConformingToProtocol: TestProtocol {}
fileprivate struct TestStructConformingToProtocol: TestProtocol {}

final class BeAKindOfSwiftTest: XCTestCase {
    enum TestEnum {
        case one, two
    }
    
    func testPositiveMatch() {
        XCTAssert(expect(1).to(beAKindOf(Int.self)))
        XCTAssert(expect(1).toNot(beAKindOf(String.self)))
        XCTAssert(expect("turtle string").to(beAKindOf(String.self)))
        XCTAssert(expect("turtle string").toNot(beAKindOf(TestClassConformingToProtocol.self)))
        
        XCTAssert(expect(TestEnum.one).to(beAKindOf(TestEnum.self)))
        
        let testProtocolClass = TestClassConformingToProtocol()
        XCTAssert(expect(testProtocolClass).to(beAKindOf(TestClassConformingToProtocol.self)))
        XCTAssert(expect(testProtocolClass).to(beAKindOf(TestProtocol.self)))
        XCTAssert(expect(testProtocolClass).toNot(beAKindOf(TestStructConformingToProtocol.self)))
        
        let testProtocolStruct = TestStructConformingToProtocol()
        XCTAssert(expect(testProtocolStruct).to(beAKindOf(TestStructConformingToProtocol.self)))
        XCTAssert(expect(testProtocolStruct).to(beAKindOf(TestProtocol.self)))
        XCTAssert(expect(testProtocolStruct).toNot(beAKindOf(TestClassConformingToProtocol.self)))
    }
}

