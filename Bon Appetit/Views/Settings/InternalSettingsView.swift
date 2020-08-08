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
            Toggle(isOn: $appState.showScopeForCafeSearch) {
                Text("Show scope for cafe search")
            }
        }
    }
}

struct InternalSettings_Previews: PreviewProvider {
    static var previews: some View {
        InternalSettings()
    }
}
