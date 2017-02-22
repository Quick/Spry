//
//  XCTestCaseProvider.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import Foundation
import XCTest

// XCTestCaseProvider is defined in swift-corelibs-xctest, but is not available
// in the XCTest that ships with Xcode. By defining this protocol on Apple platforms,
// we ensure that the tests fail in Xcode if they haven't been configured properly to
// be run with the open-source tools.
#if os(OSX) || os(iOS)
    
    public protocol XCTestCaseProvider {
        var allTests: [(String, () throws -> Void)] { get }
    }
    
    extension XCTestCase {
        override open func tearDown() {
            if let provider = self as? XCTestCaseProvider {
                provider.assertContainsTest(name: invocation!.selector.description)
            }
            
            super.tearDown()
        }
    }
    
    extension XCTestCaseProvider {
        fileprivate func assertContainsTest(name: String) {
            let contains = self.allTests.contains(where: { test in
                return test.0 == name
            })
            
            XCTAssert(contains, "Test '\(name)' is missing from the allTests array")
        }
    }
    
#endif
