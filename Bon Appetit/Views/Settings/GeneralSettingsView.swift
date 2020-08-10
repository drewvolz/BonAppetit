//
//  GeneralSettingsView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/9/20.
//

import SwiftUI

struct GeneralSettingsView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Section(
            header: HStack {
                Image(systemName: "umbrella")
                Text("General")
            }
        ){
            NavigationLink(
                destination: Appearance(),
                label: {
                    Text("Appearance")
                })
        }
    }
}

private extension GeneralSettingsView {
    @ViewBuilder func Appearance() -> some View {
        List {
            Toggle(isOn: $appState.isDarkModeEnabled) {
                Text("Dark mode")
            }
        }
        .insetGroupedStyle()
        .navigationTitle("Appearance")
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
