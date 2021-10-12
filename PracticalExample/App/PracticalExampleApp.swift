//
//  PracticalExampleApp.swift
//  PracticalExample
//
//  Created by Adam Nagy on 2021. 10. 12..
//

import SwiftUI
import API

@main
struct PracticalExampleApp: App {
    private let store = Store()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationTitle("Contents")
            }
            .environmentObject(store)
        }
    }
}
