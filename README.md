<a href="https://travis-ci.org/shaps80/Spry">![Travis](https://travis-ci.org/shaps80/Spry.svg?branch=master)</a>
<a href="https://travis-ci.org/shaps80/Spry">![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20macos-lightgrey.svg)</a>
<a href="https://github.com/shaps80/Spry/raw/master/Spry-Playground.zip">![Swift Playgrounds](https://img.shields.io/badge/platform-mac-blue.svg)
<a href="https://github.com/shaps80/Spry/raw/master/Spry-Playground.zip">![Xcode Playgrounds](https://img.shields.io/badge/platform-ipad-blue.svg)

# Spry

Spry is a Swift Playgrounds Unit Testing library based on [Nimble](http://github.com/Quick/Nimble).

<img src="https://github.com/shaps80/Spry/raw/master/playground.png" width=658 height=100%>

The best thing about Spry is that the API matches Nimble perfectly. Which means once you've created your code and tests in a Playground, you can copy them directly into your Xcode project without needing to (re)write them again :)

# Download

There are a couple of ways you can download Spry.

## Template
You can download a Playground including the lastest version of Spry. Consider this a boilerplate template. It includes Spry in the `Sources` folder of the Playground, so you can simply start writing tests alongside your code in the Playground.

[Download Playground](https://github.com/shaps80/Spry/raw/master/Spry-Playground.zip)

## Manual
You can also download or checkout this repo and simply copy the files into your existing Playground manually. Simply copy the entire `Spry` folder into your Playground's `Sources` folder. Easy Peasy!

# Nimble-esque

Spry is a stripped down (Lite) version of Nimble that includes a subset of Nimble's Matchers.

> Note: This is a port of Nimble only, since [Quick](http://github.com/Quick/Quick) doesn't really make sense in the context of a Playground.

The following keywords are **NOT** included (since they are a part of Quick):

`describe`  
`context`  
`it`

The following keywords **ARE** included:

`expect`  
`to`  
`toEventually`

Along with the following Matchers:

`beAKindOf`  
`beAnInstanceOf`  
`beCloseTo`  
`beEmpty`  
`beginWith`  
`beGreaterThan`  
`beGreaterThanOrEqualTo`  
`beIdenticalTo`  
`beLessThan`  
`beLessThanOrEqualTo`  
`beLogical`  
`beNil`  
`beVoid`  
`containElementSatisfying`  
`contain`  
`endWith`  
`equal`  
`haveCount`  
`match`  
`satisfyAnyOf`  

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
