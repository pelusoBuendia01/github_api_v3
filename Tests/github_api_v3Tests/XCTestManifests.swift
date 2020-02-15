import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(github_api_v3Tests.allTests),
    ]
}
#endif
