//
//  SearchBarModifier.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/2/20.
//

import SwiftUI

struct SearchBarModifier: ViewModifier {
    let searchBar: SearchBar

    func body(content: Content) -> some View {
        content
            .overlay(
                ViewControllerResolver { viewController in
                    viewController.navigationItem.searchController = self.searchBar.searchController
                }
                .frame(width: 0, height: 0)
            )
    }
}

extension View {
    func add(searchBar: SearchBar) -> some View {
        return modifier(SearchBarModifier(searchBar: searchBar))
    }
}
