//
//  UIApplication.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

extension UIApplication {
    // MARK: App metadata

    static var appVersion: String {
        guard let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") else {
            return ""
        }

        return version as! String
    }

    static var buildNumber: String {
        guard let number = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") else {
            return ""
        }
        
        return number as! String
    }

    static var bundleName: String {
        guard let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") else {
            return ""
        }

        return name as! String
    }
    
    // MARK: Editing
    
    func endEditing(_ force: Bool) {
        windows
            .filter { $0.isKeyWindow }
            .first?
            .endEditing(force)
    }
}
