//
//  SettingsView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    
    let support = Support()

    var body: some View {
        NavigationView {
            List {
                #if DEBUG
                    InternalSettings()
                #endif

                Section(
                    header: HStack {
                        Image(systemName: "umbrella")
                        Text("General")
                    }
                ){
                    Toggle(isOn: $appState.isDarkModeEnabled) {
                        Text("Dark mode")
                    }
                }

                Section(
                    header: HStack {
                        Image(systemName: "tortoise")
                        Text("About")
                    },
                    footer: HStack {
                        Spacer()
                        Text("Built with ❤️ by Terrapin Studio")
                        Spacer()
                    }
                ){
                    HStack {
                        Text("Version")
                        Spacer()
                        Text(UIApplication.appVersion)
                    }

                    HStack {
                        Text("Build number")
                        Spacer()
                        Text(UIApplication.buildNumber)
                    }

                    EmailButton(title: "Contact support",
                                       to: support.to,
                                       subject: support.subject,
                                       content: support.body)
                }
            }
            .insetGroupedStyle()
            .navigationTitle("Settings")
            .preferredColorScheme(appState.isDarkModeEnabled ? .dark : .light)
        }
    }
}

extension SettingsView {
    struct Support {
        let to = "support@terrapin.studio"
        let subject = "Support: \(UIApplication.bundleName)"
        let body = """
            Idea? Question? Comment? Concern? Let us know.
            
            ----- Please do not edit below here -----
            \(UIApplication.appVersion)+\(UIApplication.buildNumber)
            """
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
