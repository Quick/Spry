//
//  beAnInstanceOf.swift
//  Spry
//
//  Created by Shaps Benkau on 22/02/2017.
//
//

import XCTest
import Spry

fileprivate protocol TestProtocol {}
fileprivate class TestClassConformingToProtocol: TestProtocol {}
fileprivate struct TestStructConformingToProtocol: TestProtocol {}

final class Test_beAnInstanceOf: XCTestCase {
    
    func testPositiveMatch() {
        XCTAssert(expect(NSNull()).to(beAnInstanceOf(NSNull.self)).expectationResult)
        XCTAssert(expect(NSNumber(value:1)).toNot(beAnInstanceOf(NSDate.self)).expectationResult)
    }
    
    enum TestEnum {
        case one, two
    }
    
    func testPositiveMatchSwiftTypes() {
        XCTAssert(expect(1).to(beAnInstanceOf(Int.self)).expectationResult)
        XCTAssert(expect("test").to(beAnInstanceOf(String.self)).expectationResult)
        
        XCTAssert(expect(TestEnum.one).to(beAnInstanceOf(TestEnum.self)).expectationResult)
        
        let testProtocolClass = TestClassConformingToProtocol()
        XCTAssert(expect(testProtocolClass).to(beAnInstanceOf(TestClassConformingToProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolClass).toNot(beAnInstanceOf(TestProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolClass).toNot(beAnInstanceOf(TestStructConformingToProtocol.self)).expectationResult)
        
        let testProtocolStruct = TestStructConformingToProtocol()
        XCTAssert(expect(testProtocolStruct).to(beAnInstanceOf(TestStructConformingToProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolStruct).toNot(beAnInstanceOf(TestProtocol.self)).expectationResult)
        XCTAssert(expect(testProtocolStruct).toNot(beAnInstanceOf(TestClassConformingToProtocol.self)).expectationResult)
    }
    
}
