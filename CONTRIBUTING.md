
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [Welcome to Spry!](#welcome-to-spry)
  - [Reporting Bugs](#reporting-bugs)
  - [Building the Project](#building-the-project)
  - [Running the tests](#running-the-tests)
  - [Pull Requests](#pull-requests)
    - [Style Conventions](#style-conventions)
  - [Core Members](#core-members)
    - [Code of Conduct](#code-of-conduct)
    - [Creating a Release](#creating-a-release)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Welcome to Spry!

We're building a testing framework for a new generation of Swift Playground developers.

Spry should be easy to use and easy to maintain. Let's keep things
simple and well-tested.

**tl;dr:** If you've added a file to the project, make sure it's
included in both the OS X and iOS targets.

## Reporting Bugs

Nothing is off-limits. If you're having a problem, we want to hear about
it.

- See a crash? File an issue.
- Code isn't compiling, but you don't know why? Sounds like you should
  submit a new issue, bud.
- Went to the kitchen, only to forget why you went in the first place?
  Better submit an issue.

Be sure to include in your issue:

- Your Xcode version (eg - Xcode 7.0.1 7A1001)
- Your version of Spry (eg - v1.0.0 or git sha `db7933779ca2a36ed60242a8f858879ed73f2af2`)
- What are the steps to reproduce this issue?
- What platform are you using? (eg - OS X, iOS)
- If the problem is on a UI Testing Bundle, or some other target configuration
- Are you using Xcode or iPad?

## Building the Project

- Use `Spry.xcodeproj` to work on Spry.

## Running the tests

1. Install `fastlane` with `gem` to run both iOS and macOS tests automatically:

    gem install fastlane

2. Run `./fastlane test`

3. Alternatively you can run the tests against each target from inside Xcode as well.

## Pull Requests

- Nothing is trivial. Submit pull requests for anything: typos,
  whitespace, you name it.
- Not all pull requests will be merged, but all will be acknowledged. If
  no one has provided feedback on your request, ping one of the owners
  by name.
- Make sure your pull request includes any necessary updates to the
  README or other documentation.
- Be sure the unit tests for both the OS X and iOS targets of Spry
  before submitting your pull request. You can run all the OS X & iOS unit
  tests using `./fastlane test`.
- If you've added a file to the project, make sure it's included in both
  the OS X and iOS targets.
- The `master` branch will always support the stable Xcode version. Other
  branches will point to their corresponding versions they support.
- The `master` branch will always support the latest release of Swift. Other branches will point to their corresponding versions they support.
- If you're making a configuration change, make sure to edit the xcode project.


### Style Conventions

- Indent using 4 spaces.
- Keep lines 100 characters or shorter. Break long statements into
  shorter ones over multiple lines.
- In Objective-C, use `#pragma mark -` to mark public, internal,
  protocol, and superclass methods.
- In Swift, use `// MARK: ` to mark public, internal, protocol and superclass methods.

## Core Members

If a few of your pull requests have been merged, and you'd like a
controlling stake in the project, file an issue asking for write access
to the repository.

### Code of Conduct

Your conduct as a core member is your own responsibility, but here are
some "ground rules":

- Feel free to push whatever you want to master, and (if you have
  ownership permissions) to create any repositories you'd like.

  Ideally, however, all changes should be submitted as GitHub pull
  requests. No one should merge their own pull request, unless no
  other core members respond for at least a few days.

  If you'd like to create a new repository, it'd be nice if you created
  a GitHub issue and gathered some feedback first.

- It'd be awesome if you could review, provide feedback on, and close
  issues or pull requests submitted to the project. Please provide kind,
  constructive feedback. Please don't be sarcastic or snarky.

### Creating a Release

The process is relatively straight forward, but here's a useful checklist for tagging:

- Look at changes from the previously tagged release and write release notes: `git log v0.4.0...HEAD`
- Create a new [GitHub release](https://github.com/Quick/Spry/releases).
  - Use the same release notes you created for the tag, but tweak up formatting for GitHub.
- Announce!