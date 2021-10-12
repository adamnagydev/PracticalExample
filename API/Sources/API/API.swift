import Foundation
import Combine

public class API {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func fetch(_ endpoint: Endpoint) -> AnyPublisher<[ContentResponse], Error> {
        session.dataTaskPublisher(for: endpoint.url)
            .map(\.data)
            .decode(type: DataContainer<[ContentResponse]>.self, decoder: JSONDecoder.api)
            .map(\.data)
            .eraseToAnyPublisher()
    }

    public func fetchAll() -> AnyPublisher<[ContentResponse], Error> {
        Publishers.MergeMany(fetch(.articles), fetch(.videos))
            .collect()
            .map { $0.flatMap { $0 } }
            .eraseToAnyPublisher()
    }
}
