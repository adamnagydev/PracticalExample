//
//  Content.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import Foundation

struct Content: Identifiable {
    let id: String
    let name: String
    let technology: String?
    let artwork: URL
    let description: String
    let type: ContentType
    let date: Date

    var dateDescription: String {
        DateFormatter.mmmDyyyy.string(from: date)
    }

    var shortAttributes: String {
        "\(dateDescription) · \(type.title)"
    }

    var longAttributes: String {
        "\(shortAttributes)\(technology.map { " · \($0)"} ?? "")"
    }

    enum ContentType: String, Identifiable, CaseIterable {
        case article
        case video

        var title: String { rawValue.capitalized }
        var id: String { rawValue }
    }
}

// MARK: Mock object for Previews

extension Content {
    static let mock = Content(
        id: UUID().uuidString,
        name: "Learn SwiftUI!",
        technology: "SwiftUI",
        artwork: URL(string: "https://files.betamax.raywenderlich.com/attachments/collections/244/e2d20345-06fb-42f4-8366-c7ffe80b5f77.png")!,
        description: "SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible. With SwiftUI, you can bring even better experiences to all users, on any Apple device, using just one set of tools and APIs.",
        type: .article,
        date: Date()
    )
}
