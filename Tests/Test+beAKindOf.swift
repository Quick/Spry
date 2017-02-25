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

final class Test_beAKindOf: XCTestCase {
    enum TestEnum {
        case one, two
    }
    
    func testPositiveMatch() {
        XCTAssert(expect(1).to(beAKindOf(Int.self)).expectationResult)
        XCTAssert(expect(1).toNot(beAKindOf(String.self)).expectationResult)
        XCTAssert(expect("turtle string").to(beAKindOf(String.self)).expectationResult)
        XCTAssert(expect("turtle string").toNot(beAKindOf(TestClassConformingToProtocol.self)).expectationResult)
        
        XCTAssert(expect(TestEnum.one).to(beAKindOf(TestEnum.self)).expectationResult)
        
        let testProtocolClass = TestClassConformingToProtocol()
        XCTAssert(expect(testProtocolClass).to(beAKindOf(TestClassConformingToProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolClass).to(beAKindOf(TestProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolClass).toNot(beAKindOf(TestStructConformingToProtocol.self)).expectationResult)
        
        let testProtocolStruct = TestStructConformingToProtocol()
        XCTAssert(expect(testProtocolStruct).to(beAKindOf(TestStructConformingToProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolStruct).to(beAKindOf(TestProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolStruct).toNot(beAKindOf(TestClassConformingToProtocol.self)).expectationResult)
    }
}
