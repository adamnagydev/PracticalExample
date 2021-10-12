//
//  ContentListView.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import SwiftUI

struct ContentListView: View {
    @StateObject private var viewModel: ViewModel

    init(items: [Content]) {
        self._viewModel = StateObject(wrappedValue: .init(items: items))
    }

    var body: some View {
        VStack(alignment: .leading) {
            picker
            list
        }
    }

    var list: some View {
        List(viewModel.listItems) { item in
            NavigationLink(destination: viewModel.destination(for: item)) {
                ContentListItemView(item: item)
            }
        }
        .listStyle(PlainListStyle())
    }

    var picker: some View {
        HorizontalPicker(
            selected: $viewModel.selected,
            items: Content.ContentType.allCases
        ) { type in
            Text(type.title)
                .foregroundColor(.white)
                .padding(10)
                .background(Capsule().fill(viewModel.selected == type ? Color.primary : .secondary))
        }
        .padding(.horizontal, 10)
    }
}

extension ContentListView {

    final class ViewModel: ObservableObject {
        private let items: [Content]
        @Published var selected: Content.ContentType?

        init(items: [Content]) {
            self.items = items
        }

        var listItems: [Content] {
            let sorted = items.sorted { $0.date > $1.date }
            guard let selected = selected else { return sorted }
            return sorted.filter { $0.type == selected }
        }

        func destination(for item: Content) -> ContentListItemDetailsView {
            .init(item: item)
        }
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView(items: [])
    }
}
