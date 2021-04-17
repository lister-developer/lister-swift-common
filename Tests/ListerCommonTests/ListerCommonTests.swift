import XCTest
@testable import ListerCommon

final class ListerCommonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ListerCommon().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
