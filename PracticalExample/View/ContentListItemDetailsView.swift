//
//  ContentListItemDetailsView.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import SwiftUI
import Kingfisher

struct ContentListItemDetailsView: View {
    let item: Content

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                header
                content
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    var header: some View {
        ZStack(alignment: .bottomLeading) {
            KFImage(item.artwork)
                .resizable()
                .scaledToFill()
                .overlay(LinearGradient(colors: [Color.white, Color.clear], startPoint: .bottom, endPoint: .top))
            Text(item.name)
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
        }
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.longAttributes)
                .foregroundColor(.secondary)
            Text(item.description)
        }
        .padding()
    }
}

struct ContentListItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentListItemDetailsView(item: .mock)
        }
    }
}
