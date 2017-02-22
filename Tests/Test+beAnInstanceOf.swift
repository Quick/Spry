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
        expect(NSNull()).to(beAnInstanceOf(NSNull.self))
        expect(NSNumber(value:1)).toNot(beAnInstanceOf(NSDate.self))
    }
    
    enum TestEnum {
        case one, two
    }
    
    func testPositiveMatchSwiftTypes() {
        expect(1).to(beAnInstanceOf(Int.self))
        expect("test").to(beAnInstanceOf(String.self))
        
        expect(TestEnum.one).to(beAnInstanceOf(TestEnum.self))
        
        let testProtocolClass = TestClassConformingToProtocol()
        expect(testProtocolClass).to(beAnInstanceOf(TestClassConformingToProtocol.self))
        expect(testProtocolClass).toNot(beAnInstanceOf(TestProtocol.self))
        expect(testProtocolClass).toNot(beAnInstanceOf(TestStructConformingToProtocol.self))
        
        let testProtocolStruct = TestStructConformingToProtocol()
        expect(testProtocolStruct).to(beAnInstanceOf(TestStructConformingToProtocol.self))
        expect(testProtocolStruct).toNot(beAnInstanceOf(TestProtocol.self))
        expect(testProtocolStruct).toNot(beAnInstanceOf(TestClassConformingToProtocol.self))
    }
    
}
