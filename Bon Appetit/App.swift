//
//  App.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/2/20.
//

import SwiftUI

@main
struct BonApp: App {
    var body: some Scene {
        let appState = AppState()

        WindowGroup {
            CafeListView()
                .environmentObject(appState)
        }
    }
}
