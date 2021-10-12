import XCTest
import Combine
@testable import API

final class APITests: XCTestCase {

    func testArticlesAvailablilityAndDecoding() {
        let isSucceeded = API().fetch(.articles)
            .test(expectation: "get articles with success")
            .isSucceeded

        XCTAssertTrue(isSucceeded)
    }

    func testVideosAvailablilityAndDecoding() {
        let isSucceeded = API().fetch(.videos)
            .test(expectation: "get videos with success")
            .isSucceeded

        XCTAssertTrue(isSucceeded)
    }

    func testFetchingAllContent() throws {
        let isSucceeded = API().fetchAll()
            .test(expectation: "get all content with success")
            .isSucceeded

        XCTAssertTrue(isSucceeded)
    }
}
