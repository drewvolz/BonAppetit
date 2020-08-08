//
//  Constants.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import Foundation

struct Urls {
    private struct Domains {
        struct BonAppetit {
            static let Base = "https://legacy.cafebonappetit.com"
        }

        struct GitHub {
            static let Base = "https://stolaf.dev"
        }
    }

    private struct Routes {
        static let Api = "/api/2"
        static let Pages = "/BonApp-Widget"
    }

    private static let ApiURL = Domains.BonAppetit.Base + Routes.Api
    private static let CafesURL = Domains.GitHub.Base + Routes.Pages

    struct api {
        static var menus: String {
            return ApiURL + "/menus"
        }

        static var cafesList: String {
            return CafesURL + "/scripts/data.json"
        }
    }
}
