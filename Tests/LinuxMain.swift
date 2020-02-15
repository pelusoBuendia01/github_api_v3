import XCTest

import github_api_v3Tests

var tests = [XCTestCaseEntry]()
tests += github_api_v3Tests.allTests()
XCTMain(tests)
