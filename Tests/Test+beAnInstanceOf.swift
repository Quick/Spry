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
        XCTAssert(expect(NSNull()).to(beAnInstanceOf(NSNull.self)))
        XCTAssert(expect(NSNumber(value:1)).toNot(beAnInstanceOf(NSDate.self)))
    }
    
    enum TestEnum {
        case one, two
    }
    
    func testPositiveMatchSwiftTypes() {
        XCTAssert(expect(1).to(beAnInstanceOf(Int.self)))
        XCTAssert(expect("test").to(beAnInstanceOf(String.self)))
        
        XCTAssert(expect(TestEnum.one).to(beAnInstanceOf(TestEnum.self)))
        
        let testProtocolClass = TestClassConformingToProtocol()
        XCTAssert(expect(testProtocolClass).to(beAnInstanceOf(TestClassConformingToProtocol.self)))
        XCTAssert(expect(testProtocolClass).toNot(beAnInstanceOf(TestProtocol.self)))
        XCTAssert(expect(testProtocolClass).toNot(beAnInstanceOf(TestStructConformingToProtocol.self)))
        
        let testProtocolStruct = TestStructConformingToProtocol()
        XCTAssert(expect(testProtocolStruct).to(beAnInstanceOf(TestStructConformingToProtocol.self)))
        XCTAssert(expect(testProtocolStruct).toNot(beAnInstanceOf(TestProtocol.self)))
        XCTAssert(expect(testProtocolStruct).toNot(beAnInstanceOf(TestClassConformingToProtocol.self)))
    }
    
}
