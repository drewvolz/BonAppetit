//
//  AppState.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

class AppState: ObservableObject {
    // MARK: keys

    static var darkMode = "isDarkModeEnabled"
    static var cafeSearch = "showScopeForCafeSearch"
    
    // MARK: general settings

    @Published var isDarkModeEnabled = UserDefaults.standard.bool(forKey: AppState.darkMode) {
        didSet {
            UserDefaults.standard.set(isDarkModeEnabled, forKey: AppState.darkMode)
        }
    }

    // MARK: debug + feature flags

    @Published var showScopeForCafeSearch = UserDefaults.standard.bool(forKey: AppState.cafeSearch) {
        didSet {
            UserDefaults.standard.set(showScopeForCafeSearch, forKey: AppState.cafeSearch)
        }
    }
}
