//
//  ContentListItemView.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import SwiftUI
import Kingfisher

struct ContentListItemView: View {
    let item: Content

    var body: some View {
        VStack(alignment: .leading) {
            header
            description
        }
    }

    var header: some View {
        HStack {
            title
            Spacer()
            KFImage(item.artwork)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

    var title: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.name)
                .font(.headline)
            if let tech = item.technology {
                Text(tech)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }

    var description: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(item.description)
                .lineLimit(5)
                .font(.subheadline)
            Text(item.shortAttributes)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListItemView(item: .mock)
            .padding()
    }
}
