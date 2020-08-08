//
//  CafeList.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct CafeListResponse: Hashable, Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case label
        case desc
    }

    var id: String
    var label: String
    var desc: String
}
