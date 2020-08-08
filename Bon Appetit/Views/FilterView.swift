//
//  ContentView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/2/20.
//

import SwiftUI

struct FilterView: View {
    @ObservedObject var searchViewModel = CafeListViewModel()
    @ObservedObject var menuViewModel = MenuListViewModel()

    @State var recent = ["Rice", "Chicken", "Gyoza"]
    @State var restrictions = ["Vegetarian", "Seafood Watch", "Vegan", "Made without Gluten"]
    @State var stations = ["Tortilla", "Pasta", "Grains", "Bowls", "Home"]

    var body: some View {
            List {
                Section(header: Text("Recent Searches")) {
                    ForEach(recent, id: \.self) { data in
                        Row(imageName: "magnifyingglass", text: data)
                    }
                }

                Section(header: Text("Dietary Restrictions")) {
                    ForEach(restrictions, id: \.self) { data in
                        Row(imageName: "heart", text: data)
                    }
                }

                Section(header: Text("Stations")) {
                    ForEach(stations, id: \.self) { data in
                        Row(imageName: "line.horizontal.3.decrease.circle", text: data)
                    }
                }
            }
            .insetGroupedStyle()
    }
}

struct Row: View {
    @State var imageName = ""
    @State var text = ""

    var body: some View {
        HStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
