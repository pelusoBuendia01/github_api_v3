import XCTest
@testable import github_api_v3

final class github_api_v3Tests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(github_api_v3().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
