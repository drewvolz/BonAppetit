//
//  SettingsView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var appState: AppState
    @Binding var showingSettings: Bool

    let support = Support()

    var body: some View {
        NavigationView {
            List {
                #if DEBUG
                    InternalSettings()
                #endif
                GeneralSettingsView()
                AboutView()
            }
            .insetGroupedStyle()
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: DoneButton())
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
    
    @ViewBuilder func AboutView() -> some View {
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

    @ViewBuilder func DoneButton() -> some View {
        Button(action: {
            self.showingSettings.toggle()
        }) {
            Text("Done")
        }
        .buttonStyle(PlainButtonStyle())
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    @State var showingSettings: Bool = true
//
//    static var previews: some View {
//        SettingsView( showingSettings: $showingSettings)
//    }
//}
