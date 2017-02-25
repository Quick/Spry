//
//  Test+containElementSatisfying.swift
//  Spry
//
//  Created by Shahpour Benkau on 23/02/2017.
//
//

import XCTest
import Spry

final class Test_containElementSatisfying: XCTestCase {
    
    func testContainElementSatisfying() {
        var orderIndifferentArray = [1, 2, 3]
        XCTAssert(expect(orderIndifferentArray).to(containElementSatisfying({ number in
            return number == 1
        })).expectationResult)
        XCTAssert(expect(orderIndifferentArray).to(containElementSatisfying({ number in
            return number == 2
        })).expectationResult)
        XCTAssert(expect(orderIndifferentArray).to(containElementSatisfying({ number in
            return number == 3
        })).expectationResult)
        
        orderIndifferentArray = [3, 1, 2]
        XCTAssert(expect(orderIndifferentArray).to(containElementSatisfying({ number in
            return number == 1
        })).expectationResult)
        XCTAssert(expect(orderIndifferentArray).to(containElementSatisfying({ number in
            return number == 2
        })).expectationResult)
        XCTAssert(expect(orderIndifferentArray).to(containElementSatisfying({ number in
            return number == 3
        })).expectationResult)
    }
    
}
