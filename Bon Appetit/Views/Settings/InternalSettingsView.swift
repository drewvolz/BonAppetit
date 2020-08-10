//
//  InternalSettings.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct InternalSettings: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Section(header: HStack {
            Image(systemName: "ant")
            Text("Internal")
        }) {
            NavigationLink(
                destination: FeatureFlags(),
                label: {
                    Text("Feature flags")
                })
        }
    }
}

private extension InternalSettings {
    @ViewBuilder func FeatureFlags() -> some View {
        List {
            Toggle(isOn: $appState.showScopeForCafeSearch) {
                Text("Show scope for cafe search")
            }
        }
        .insetGroupedStyle()
        .navigationTitle("Feature flags")
    }
}

struct InternalSettings_Previews: PreviewProvider {
    static var previews: some View {
        InternalSettings()
    }
}
