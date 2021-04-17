import XCTest

import lister_commonTests

var tests = [XCTestCaseEntry]()
tests += lister_commonTests.allTests()
XCTMain(tests)
