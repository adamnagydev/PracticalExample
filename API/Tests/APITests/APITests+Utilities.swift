import Foundation
import XCTest
import Combine

extension Publisher {
    func test(expectation: String, timeout: TimeInterval = 2.0) -> Result<Output, Failure> {
        let e = XCTestExpectation(description: expectation)
        var result: Result<Output, Failure>! {
            didSet { e.fulfill() }
        }

        let cancellabe = self.sink(
            receiveCompletion: {
                if case let .failure(error) = $0 {
                    Swift.print("💥", error)
                    result = .failure(error)
                }
            },
            receiveValue: {
                result = .success($0)
            }
        )

        XCTWaiter().wait(for: [e], timeout: timeout)
        cancellabe.cancel()
        return result
    }
}

extension Result {
    var isSucceeded: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
}
