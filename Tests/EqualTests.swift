//
//  EqualTests.swift
//  Spry
//
//  Created by Shahpour Benkau on 22/02/2017.
//
//

import XCTest
import Spry

class EqualTests: XCTestCase, XCTestCaseProvider {
    
    var allTests: [(String, () throws -> Void)] {
        return [
            ("testEquality", testEquality),
            ("testArrayEquality", testArrayEquality),
            ("testSetEquality", testSetEquality),
            ("testDictionaryEquality", testDictionaryEquality),
            ("testDataEquality", testDataEquality),
            ("testNSObjectEquality", testNSObjectEquality),
            ("testOperatorEquality", testOperatorEquality),
            ("testOperatorEqualityWithArrays", testOperatorEqualityWithArrays),
            ("testOperatorEqualityWithDictionaries", testOperatorEqualityWithDictionaries),
            ("testOptionalEquality", testOptionalEquality),
            ("testArrayOfOptionalsEquality", testArrayOfOptionalsEquality),
            ("testDictionariesWithDifferentSequences", testDictionariesWithDifferentSequences),
        ]
    }

    func testEquality() {
        XCTAssert(expect(1 as CInt).to(equal(1 as CInt)))
        XCTAssert(expect(1 as CInt).to(equal(1)))
        XCTAssert(expect(1).to(equal(1)))
        XCTAssert(expect("hello").to(equal("hello")))
        XCTAssert(expect("hello").toNot(equal("world")))
    }
    
    func testArrayEquality() {
        XCTAssert(expect([1, 2, 3]).to(equal([1, 2, 3])))
        XCTAssert(expect([1, 2, 3]).toNot(equal([1, 2])))
        XCTAssert(expect([1, 2, 3]).toNot(equal([1, 2, 4])))
        
        let array1: Array<Int> = [1, 2, 3]
        let array2: Array<Int> = [1, 2, 3]
        XCTAssert(expect(array1).to(equal(array2)))
        XCTAssert(expect(array1).to(equal([1, 2, 3])))
        XCTAssert(expect(array1).toNot(equal([1, 2] as Array<Int>)))
    }
    
    func testSetEquality() {
        XCTAssert(expect(Set([1, 2])).to(equal(Set([1, 2]))))
        XCTAssert(expect(Set<Int>()).to(equal(Set<Int>())))
        XCTAssert((Set<Int>()) == Set<Int>())
        XCTAssert((Set([1, 2])) != Set<Int>())
    }
    
    func testDictionaryEquality() {
        XCTAssert(expect(["foo": "bar"]).to(equal(["foo": "bar"])))
        XCTAssert(expect(["foo": "bar"]).toNot(equal(["foo": "baz"])))
        
        let actual = ["foo": "bar"]
        let expected = ["foo": "bar"]
        let unexpected = ["foo": "baz"]
        XCTAssert(expect(actual).to(equal(expected)))
        XCTAssert(expect(actual).toNot(equal(unexpected)))
    }
    
    func testDataEquality() {
        let actual = "foobar".data(using: .utf8)
        let expected = "foobar".data(using: .utf8)!
        let unexpected = "foobarfoo".data(using: .utf8)!
        
        XCTAssert(expect(actual).to(equal(expected)))
        XCTAssert(expect(actual).toNot(equal(unexpected)))
    }
    
    func testNSObjectEquality() {
        XCTAssert(expect(NSNumber(value:1)).to(equal(NSNumber(value:1))))
        XCTAssert((NSNumber(value:1)) == NSNumber(value:1))
        XCTAssert((NSNumber(value:1)) != NSNumber(value:2))
    }
    
    func testOperatorEquality() {
        XCTAssert(("foo") == "foo")
        XCTAssert(("foo") != "bar")
    }
    
    func testOperatorEqualityWithArrays() {
        let array1: Array<Int> = [1, 2, 3]
        let array2: Array<Int> = [1, 2, 3]
        let array3: Array<Int> = [1, 2]
        XCTAssert((array1) == array2)
        XCTAssert((array1) != array3)
    }
    
    func testOperatorEqualityWithDictionaries() {
        let dict1 = ["foo": "bar"]
        let dict2 = ["foo": "bar"]
        let dict3 = ["foo": "baz"]
        XCTAssert((dict1) == dict2)
        XCTAssert((dict1) != dict3)
    }
    
    func testOptionalEquality() {
        XCTAssert(expect(1 as CInt?).to(equal(1)))
        XCTAssert(expect("One" as String?).to(equal("One")))
    }
    
    func testArrayOfOptionalsEquality() {
        let array1: Array<Int?> = [1, nil, 3]
        let array2: Array<Int?> = [nil, 2, 3]
        let array3: Array<Int?> = [1, nil, 3]
        
        XCTAssert(expect(array1).toNot(equal(array2)))
        XCTAssert(expect(array1).to(equal(array3)))
        XCTAssert(expect(array2).toNot(equal(array3)))
        
        let allNils1: Array<String?> = [nil, nil, nil, nil]
        let allNils2: Array<String?> = [nil, nil, nil, nil]
        let notReallyAllNils: Array<String?> = [nil, nil, nil, "turtles"]
        
        XCTAssert(expect(allNils1).to(equal(allNils2)))
        XCTAssert(expect(allNils1).toNot(equal(notReallyAllNils)))
        
        let noNils1: Array<Int?> = [1, 2, 3, 4, 5]
        let noNils2: Array<Int?> = [1, 3, 5, 7, 9]
        
        XCTAssert(expect(noNils1).toNot(equal(noNils2)))
    }
    
    func testDictionariesWithDifferentSequences() {
        // see: https://github.com/Quick/Nimble/issues/61
        // these dictionaries generate different orderings of sequences.
        let result = ["how":1, "think":1, "didnt":2, "because":1,
                      "interesting":1, "always":1, "right":1, "such":1,
                      "to":3, "say":1, "cool":1, "you":1,
                      "weather":3, "be":1, "went":1, "was":2,
                      "sometimes":1, "and":3, "mind":1, "rain":1,
                      "whole":1, "everything":1, "weather.":1, "down":1,
                      "kind":1, "mood.":1, "it":2, "everyday":1, "might":1,
                      "more":1, "have":2, "person":1, "could":1, "tenth":2,
                      "night":1, "write":1, "Youd":1, "affects":1, "of":3,
                      "Who":1, "us":1, "an":1, "I":4, "my":1, "much":2,
                      "wrong.":1, "peacefully.":1, "amazing":3, "would":4,
                      "just":1, "grade.":1, "Its":2, "The":2, "had":1, "that":1,
                      "the":5, "best":1, "but":1, "essay":1, "for":1, "summer":2,
                      "your":1, "grade":1, "vary":1, "pretty":1, "at":1, "rain.":1,
                      "about":1, "allow":1, "thought":1, "in":1, "sleep":1, "a":1,
                      "hot":1, "really":1, "beach":1, "life.":1, "we":1, "although":1]
        
        let storyCount = ["The":2, "summer":2, "of":3, "tenth":2, "grade":1,
                          "was":2, "the":5, "best":1, "my":1, "life.":1, "I":4,
                          "went":1, "to":3, "beach":1, "everyday":1, "and":3,
                          "we":1, "had":1, "amazing":3, "weather.":1, "weather":3,
                          "didnt":2, "really":1, "vary":1, "much":2, "always":1,
                          "pretty":1, "hot":1, "although":1, "sometimes":1, "at":1,
                          "night":1, "it":2, "would":4, "rain.":1, "mind":1, "rain":1,
                          "because":1, "cool":1, "everything":1, "down":1, "allow":1,
                          "us":1, "sleep":1, "peacefully.":1, "Its":2, "how":1,
                          "affects":1, "your":1, "mood.":1, "Who":1, "have":2,
                          "thought":1, "that":1, "could":1, "write":1, "a":1,
                          "whole":1, "essay":1, "just":1, "about":1, "in":1,
                          "grade.":1, "kind":1, "right":1, "Youd":1, "think":1,
                          "for":1, "such":1, "an":1, "interesting":1, "person":1,
                          "might":1, "more":1, "say":1, "but":1, "you":1, "be":1, "wrong.":1]
        
        XCTAssert(expect(result).to(equal(storyCount)))
    }

}
