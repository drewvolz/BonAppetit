//
//  CafeListView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct CafeListView: View {
    @EnvironmentObject var appState: AppState

    @ObservedObject var cafeListViewModel = CafeListViewModel()
    @ObservedObject var menuViewModel = MenuListViewModel()
    @ObservedObject var searchBar = SearchBar()

    @State var showingSettings = false

    init() {
        cafeListViewModel.fetch()
    }

    var body: some View {
        NavigationView {
            CafeList()
        }
        .preferredColorScheme(appState.isDarkModeEnabled ? .dark : .light)
    }
}

private extension CafeListView {
    @ViewBuilder func CafeList() -> some View {
        Group {
            if cafeListViewModel.cafeListResponse?.isEmpty == true {
                ProgressView("Loading…")
            } else {
                List(cafeListViewModel.cafeListResponse?.filter { cafe in
                    let searchBarInstance = searchBar.searchController.searchBar
                    return cafeListViewModel.search(cafe: cafe,
                                                    query: searchBar.text,
                                                    searchBarInstance: searchBarInstance)
                } ?? []) { cafe in
                    ListRow(cafe: cafe)
                }
                .insetGroupedStyle()
                .resignKeyboardOnDragGesture()
                .onAppear(perform: searchbarInit)
            }
        }
        .add(searchBar: self.searchBar)
        .navigationBarItems(trailing: SettingsButton())
        .navigationTitle("Bon Appetit")
    }
    
    @ViewBuilder func ListRow(cafe: CafeListResponse) -> some View {
        NavigationLink(destination:
                        CafeDetailView(cafeId: cafe.id)
                        .environmentObject(appState)
            .navigationTitle(cafe.label)) {
                VStack(alignment: .leading) {
                    Text(cafe.label.uppercaseFirst())
                        .font(.body)
                        .fontWeight(.bold)
                        .lineLimit(1)

                    Text(cafe.desc)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }
    }
    
    @ViewBuilder func SettingsButton() -> some View {
        Button(action: {
            self.showingSettings.toggle()
        }, label: {
            Image(systemName: "gear")
        })
        .sheet(isPresented: $showingSettings) {
            SettingsView()
                .onDisappear(perform: searchbarInit)
                .environmentObject(self.appState)
        }
    }
    
    func searchbarInit() {
        let scopes = ["All", "Northfield"]
        searchBar.initScopes(scopeList: scopes, appState: appState)
    }
}

struct CafeListView_Previews: PreviewProvider {
    static var previews: some View {
        CafeListView()
    }
}
