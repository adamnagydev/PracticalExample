//
//  Store.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import Foundation
import Combine
import API

final class Store: ObservableObject {
    private let api: API
    private var fetchCancellable: AnyCancellable?

    enum State {
        case loading
        case failed(Error)
        case loaded([Content])
    }

    @Published
    private(set) var state: State = .loading

    init(api: API = .init(session: .shared)) {
        self.api = api

        preload()
    }

    private func preload() {
        fetchCancellable = api.fetchAll()
            .receive(on: RunLoop.main)
            .retry(1)
            .handleEvents(receiveSubscription: { [weak self] _ in
                self?.state = .loading
            })
            .sinkResult { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.state = .failed(error)
                case .success(let items):
                    self?.state = .loaded(Mapper.map(items))
                }
            }
    }
}
