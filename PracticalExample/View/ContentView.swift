//
//  ContentView.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: Store

    var body: some View {
        switch store.state {
        case .loading:
            Text("⏱ Loading...")
        case .failed(let error):
            Text("🤒 Failed, \(error.localizedDescription).")
        case .loaded(let items):
            ContentListView(items: items)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
