//
//  Combine+Utilities.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import Combine

extension Publisher {

    /// 🧁 Syntactic sugar when we're only interested about the result.
    /// Ignore the receive... dance.
    func sinkResult(_ receiveResult: @escaping (Result<Output, Failure>) -> Void) -> AnyCancellable {
        return sink(
            receiveCompletion: {
                if case let .failure(error) = $0 {
                    receiveResult(.failure(error))
                }
            },
            receiveValue: {
                receiveResult(.success($0))
            }
        )
    }
}
