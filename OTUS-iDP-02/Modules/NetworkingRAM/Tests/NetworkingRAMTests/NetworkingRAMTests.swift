import XCTest
@testable import NetworkingRAM

final class NetworkingRAMTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(NetworkingRAM().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
