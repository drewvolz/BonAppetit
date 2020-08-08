//
//  StationView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct StationView: View {
    @ObservedObject var menuViewModel: MenuListViewModel

    typealias MenuItems = [MenuResponse.Item]
    typealias GroupedMenuItems = [(key: String, value: MenuItems)]
    typealias GroupedMenuItems2 = [String : [String: [MenuResponse.Item]]]

    var groupedItems: GroupedMenuItems? {
        let items = menuViewModel.menuListResponse?.items?.values.map { $0 } ?? []
        return groupItems(items: items)
    }
    
    // WIP: parsing days instead of items
    var days: GroupedMenuItems2? {
        let dayparts = menuViewModel.menuListResponse?.days?.first?.cafes.first?.value.dayparts?.first ?? []
        let grouped = groupItems2(dayparts: dayparts)
        return grouped
    }
    
    var cafeId: String
    
    init(menuViewModel: MenuListViewModel, cafeId: String) {
        self.cafeId = cafeId
        self.menuViewModel = menuViewModel
    }
    
    var body: some View {
        if groupedItems?.count == 0 {
            if menuViewModel.menuListResponse == nil {
                Loading()
            } else {
                NoData()
            }
        } else {
            StationList()
        }
    }
}

private extension StationView {
    @ViewBuilder func Loading() -> some View {
        ProgressView("Loading…")
            .font(Font.callout.weight(.light))
            .foregroundColor(.gray)

            // Note: this is a weird place to load the network request
            // but there's an infinite-request bug if I add it to init()
            // and a bug where it'll fire every time the view is popped
            // if we rely on other lifecycle methods.
            .onAppear {
                menuViewModel.fetch(cafeId: cafeId)
            }
    }
    
    @ViewBuilder func NoData() -> some View {
        VStack(spacing: 10) {
            Image(systemName: "tortoise")
            Text("No menu items")
        }
        .font(Font.callout.weight(.light))
        .foregroundColor(.gray)
    }
    
    @ViewBuilder func StationList() -> some View {
        List {
            ForEach(groupedItems ?? [], id: \.key) { station in
                Section(header: Text(station.key)) {
                    ForEach(station.value, id: \.id) { item in
                        NavigationLink(destination:
                            NutritionDetailView(item: item)
                                .navigationTitle(item.label.uppercaseFirst())
                        ) {
                            HStack(alignment: .firstTextBaseline) {
                                Text(item.label.uppercaseFirst())
                            }
                        }
                    }
                }
            }
        }
        .insetStyle()
        // WIP: debug parsing days instead of items
        .onAppear {
//            days?["Breakfast"].map { item in
//                item.map { part in
//                    print(part)
//                }
//            }
        }
    }
}

private extension StationView {
    func groupItems(items: MenuItems) -> GroupedMenuItems {
        return Dictionary(grouping: items, by: {
            cleanStation(name: $0.station ?? "")
        }).sorted { (group1, group2) -> Bool in
            group1.key.compare(group2.key) == .orderedAscending
        }
    }
    
    // WIP: parsing days instead of items
    func groupItems2(dayparts: [MenuResponse.Daypart]) -> GroupedMenuItems2 {
        typealias Daypart = [String: [MenuResponse.Item]]
        var parts: [String: Daypart] = [:]

        dayparts.forEach { day in
            day.stations?.forEach { station in
                let items = mapItems(items: station.items ?? [])
                
                var part: Daypart = [:]
                part[station.label ?? ""] = items

                parts[day.label ?? ""] = part
            }
        }
        
        return parts
    }
    
    // WIP: parsing days instead of items
    func mapItems(items: [String]) -> [MenuResponse.Item] {
        return items.map { item in
            menuViewModel.menuListResponse?.items?[Int(item) ?? 0]
        } as! [MenuResponse.Item]
    }
    
    func cleanStation(name: String) -> String {
        let words = ["<STRONG>", "</STRONG>", "@"]
        var cleanName = name

        for word in words {
            cleanName = cleanName.replacingOccurrences(of: word, with: "", options: NSString.CompareOptions.caseInsensitive, range: nil)
        }

        return cleanName
    }
}

struct StationView_Previews: PreviewProvider {
    static var previews: some View {
        StationView(menuViewModel: MenuListViewModel(), cafeId: "")
    }
}
