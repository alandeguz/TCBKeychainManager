import XCTest
@testable import TCBKeychainManager

final class TCBKeychainManagerTests: XCTestCase {
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct
    // results.
    
    let text: String? = String(describing: TCBKeychainStoreItemType.self)
    XCTAssertNotNil(text)
  }
}
