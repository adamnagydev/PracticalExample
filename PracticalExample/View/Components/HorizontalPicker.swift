//
//  HorizontalPicker.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import SwiftUI

/// Workaround as on iOS15 Picker View seems to not update state. 🤷‍♂️
struct HorizontalPicker<T: Hashable & Identifiable, Label: View>: View {
    @Binding var selected: T?
    var items: [T]
    var label: (T) -> Label

    init(selected: Binding<T?>, items: [T], @ViewBuilder label: @escaping (T) -> Label) {
        self._selected = selected
        self.items = items
        self.label = label
    }

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(items) { item in
                    label(item)
                        .onTapGesture {
                            withAnimation {
                                selected = selected == item ? nil : item
                            }
                        }
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
