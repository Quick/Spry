//#-code-completion(identifier, hide, setupLiveView())
//#-hidden-code
import Foundation

/**
 Below are some examples -- you can delete them once you're ready to get started.
 */

enum Kind {
    case one, two
}

var kind: Kind
expect(Kind.one).to(beAKindOf(Kind.self))

let instance = 45
expect(Kind.one).to(beAnInstanceOf(Kind.self))
expect(Kind.one).to(beAnInstanceOf(String.self))

let close: Float = 0.5
expect(close).to(beCloseTo(1, within: 0.6))

let empty: [Int] = []
expect(empty).to(beEmpty())

let begin = "ABC"
expect(begin).to(beginWith("ABC"))

let end = "XYZ"
expect(end).to(endWith("xyz"))

let value = 5
expect(value).to(beGreaterThan(0))
expect(value).to(beGreaterThanOrEqualTo(6))
expect(value).to(beLessThan(0))
expect(begin).to(beLessThanOrEqualTo(end))

let v1 = "Shaps"
let v2 = "Shaps"
expect(v1).toNot(beIdenticalTo(v2))
expect(v1).to(equal(v2))

let result: Bool? = nil
expect(result).toNot(beTrue())
expect(result).to(beFalsy())
expect(result).to(beNil())

let void: Void
expect(void).to(beVoid())

let numbers = [1, 2, 4]
expect(numbers).to(contain(2))
expect(numbers).to(haveCount(3))

let regex = "<html />"
expect(regex).to(match("<\\w.+/>"))
