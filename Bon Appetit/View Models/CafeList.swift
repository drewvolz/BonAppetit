//
//  CafeList.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import Combine
import SwiftUI

final class CafeListViewModel: ObservableObject {
    @Published private(set) var cafeListResponse: [CafeListResponse]? = []

    private var cafeListCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        cafeListCancellable?.cancel()
    }

    func fetch() {
        let url = URL(string: Urls.api.cafesList)!

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        let publisher = URLSession.shared.dataTaskPublisher(for: request)

        cafeListCancellable = publisher
            .map { $0.data }
            .decode(type: [CafeListResponse].self, decoder: JSONDecoder())
            .map { $0.sorted { $0.label < $1.label } }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .assign(to: \.cafeListResponse, on: self)
    }

    func search(cafe: CafeListResponse, query: String, searchBarInstance: UISearchBar) -> Bool {
        let scopedQuery = getScopedValue(searchBar: searchBarInstance) ?? ""

        if !scopedQuery.isEmpty {
            return (
                cafe.desc.lowercased().contains(scopedQuery.lowercased()) &&
                    (query.isEmpty || cafe.label.lowercased().contains(query.lowercased()))
            )
        } else {
            return (
                query.isEmpty ||
                    cafe.label.lowercased().contains(query.lowercased()) ||
                    cafe.desc.lowercased().contains(query.lowercased()) ||
                    cafe.desc.lowercased().contains(scopedQuery.lowercased())
            )
        }
    }

    private func getScopedValue(searchBar: UISearchBar) -> String? {
        guard let scopes = searchBar.scopeButtonTitles else {
            return ""
        }
        
        if scopes.count > 0 {
            if scopes[searchBar.selectedScopeButtonIndex] == "All" {
                return ""
            } else {
                return scopes[searchBar.selectedScopeButtonIndex]
            }
        }

        return ""
    }
}
