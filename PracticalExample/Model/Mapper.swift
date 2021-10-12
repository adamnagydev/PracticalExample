import API
import Foundation

/// Map API layer to Domain layer.
/// Use/format informations, which is strictly needed by the App.
enum Mapper {
    static func map(_ response: ContentResponse) -> Content {
        .init(
            id: response.id,
            name: response.attributes.name,
            technology: response.attributes.technologyTripleString.orNilIfEmpty,
            artwork: response.attributes.cardArtworkUrl,
            description: response.attributes.descriptionPlainText,
            type: map(response.attributes.contentType),
            date: response.attributes.releasedAt
        )
    }

    static func map(_ type: ContentResponse.Attributes.ContentType) -> Content.ContentType {
        switch type {
        case .article:
            return .article
        case .collection:
            return .video
        }
    }

    static func map(_ responses: [ContentResponse]) -> [Content] {
        responses.map(map)
    }
}
