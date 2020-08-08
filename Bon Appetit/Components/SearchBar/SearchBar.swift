//
//  SearchBar.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/2/20.
//

import SwiftUI

class SearchBar: NSObject, ObservableObject {
    @Published var text: String = ""
    @Published var filtering: Bool = false

    let searchController: UISearchController = UISearchController(searchResultsController: nil)

    override init() {
        super.init()
        
        searchController.delegate = self
        searchController.searchResultsUpdater = self

        searchController.obscuresBackgroundDuringPresentation = false
    }

    // todo: AppState should not be passed-in this way
    func initScopes(scopeList: [String], appState: AppState) {
        // todo: this feature flag shouldn't be inside the SearchBar component for adding scopes
        if appState.showScopeForCafeSearch {
            searchController.searchBar.scopeButtonTitles = scopeList
        } else {
            searchController.searchBar.scopeButtonTitles = []
        }
    }
}

extension SearchBar: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchBarText = searchController.searchBar.text {
            text = searchBarText
        }
    }
}

extension SearchBar: UISearchControllerDelegate {
    func didPresentSearchController(_: UISearchController) {
        filtering.toggle()
    }

    func didDismissSearchController(_: UISearchController) {
        filtering.toggle()
    }
}
