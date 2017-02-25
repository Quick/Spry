<a href="https://travis-ci.org/shaps80/Spry">![Travis](https://travis-ci.org/shaps80/Spry.svg?branch=master)</a>
<a href="https://travis-ci.org/shaps80/Spry">![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macos-lightgrey.svg)</a>
<a href="https://github.com/shaps80/Spry/raw/master/Playgrounds/Spry-Xcode.zip">![Xcode Playgrounds](https://img.shields.io/badge/playground-xcode-blue.svg)</a>
<a href="https://github.com/shaps80/Spry/raw/master/Playgrounds/Spry-iPad.zip">![iPad Playgrounds](https://img.shields.io/badge/playground-ipad-blue.svg)</a>
<a href="https://github.com/Quick/Quick/blob/master/LICENSE">![License](https://img.shields.io/badge/license-Apache%202.0-brightgreen.svg)</a>

# Spry

Spry is a Swift Playgrounds Unit Testing library based on [Nimble](http://github.com/Quick/Nimble).

<img src="https://github.com/shaps80/Spry/raw/master/Screenshots/xcode.png" width=658 height=100%>

<img src="https://github.com/shaps80/Spry/raw/master/Screenshots/ipad.png" width=658 height=100%>

The best thing about Spry is that the API matches Nimble perfectly. Which means once you've created your code and tests in a Playground, you can copy them directly into your Xcode project without needing to (re)write them again :)

> Please note: this library is not directly affiliated with Quick or Nimble -- however much of the code has been copied directly from the Nimble project. I am therefore not claiming ownership of the code herein. This library is simply a stripped down version of the Nimble framework created by [@jeffh](http://github.com/@jeffh)

# Download

There are a couple of ways you can download Spry.

## Template
You can download a Playground including the latest version of Spry. Consider this a boilerplate template. It includes Spry in the `Sources` folder of the Playground, so you can simply start writing tests alongside your code in the Playground.

<a href="https://github.com/shaps80/Spry/raw/master/Playgrounds/Spry-iPad.zip">![iPad Playgrounds](https://img.shields.io/badge/playground-ipad-blue.svg)</a>  
<a href="https://github.com/shaps80/Spry/raw/master/Playgrounds/Spry-Xcode.zip">![Xcode Playgrounds](https://img.shields.io/badge/playground-xcode-blue.svg)</a>

## Manual
You can also download or checkout this repo and simply copy the files into your existing Playground manually. Simply copy the entire `Spry` folder into your Playground's `Sources` folder. Easy Peasy!

# Nimble-esque

Spry is a stripped down (Lite) version of Nimble that includes a subset of Nimble's Matchers.

> Note: This is a port of Nimble only, since [Quick](http://github.com/Quick/Quick) doesn't really make sense in the context of a Playground.

The following features are **NOT** supported (since they are a part of Quick):

`describe`  
`context`  
`it`

Spry supports the following features:

- [x] `expect`  
- [x] `to`  
- [x] `toEventually`  
- [x] `beAKindOf`  
- [x] `beAnInstanceOf`  
- [x] `beCloseTo`  
- [x] `beEmpty`  
- [x] `beginWith`  
- [x] `beGreaterThan`  
- [x] `beGreaterThanOrEqualTo`  
- [x] `beIdenticalTo`  
- [x] `beLessThan`  
- [x] `beLessThanOrEqualTo`  
- [x] `beLogical`  
- [x] `beNil`  
- [x] `beVoid`  
- [x] `containElementSatisfying`  
- [x] `contain`  
- [x] `endWith`  
- [x] `equal`  
- [x] `haveCount`  
- [x] `match`  
- [x] `satisfyAnyOf`  
- [ ] `async`  
- [ ] `matchError`  
- [ ] `throwError`  
- [ ] `failWithMessage`  

# Usage

Using Spry is as simple as writing an `expect` case:

```swift
func add<T: ExpressibleByIntegerLiteral>(_ x: T, _ y: T) -> T {
    return x + y
}

// Spry test case
expect(add(4, 5)).to(equal(9))
```

If you're already familiar with Nimble, then you already know how to use Spry.

> For full details on how to write your tests with Spry, I suggest reading over the [Nimble docs](https://github.com/Quick/Nimble/blob/master/README.md). Keeping in mind that not all features are currently included.