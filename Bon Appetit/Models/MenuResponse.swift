//
//  MenuResponse.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct MenuResponse: Hashable, Identifiable, Decodable {
    enum CodingKeys: String, CodingKey {
        case items
        case days
    }
    
    var id: String = UUID().uuidString
    var items: [Int: Item]?
    var days: [Day]?
    
    struct Day: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case date
            case cafes
        }

        var date: String?
        var cafes: [String: Cafe]
    }
    
    struct Cafe: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case name
            case menuID
            case dayparts
        }

        var name: String?
        var menuID: String?
        var dayparts: [[Daypart]]?
    }
    
    struct Daypart: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case starttime
            case endtime
            case id
            case label
            case message
            case stations
        }

        var starttime: String?
        var endtime: String?
        var id: String?
        var label: String?
        var message: String?
        var stations: [StationElement]?
    }
    
    struct StationElement: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case orderID
            case id
            case label
            case note
            case items
        }

        var orderID: String?
        var id: String?
        var label: String?
        var note: String?
        var items: [String]?
    }

    struct Item: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case id
            case stationId = "station_id"
            case subStationId = "sub_station_id"
            case subStation = "sub_station"
            case nutritionDetails = "nutrition_details"
            case label
            case description
            case special
            case station
            case ingredients
        }
        
        var id: String?
        var stationId: String?
        var subStationId: String?
        var subStation: String?
        var nutritionDetails: Nutrition
        var label: String
        var description: String?
        var special: Int?
        var station: String?
        var ingredients: String?
    }

    struct NutritionValues: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case label
            case value
            case unit
        }
        
        var label: String?
        var value: String?
        var unit: String?
    }

    struct Nutrition: Hashable, Decodable {
        enum CodingKeys: String, CodingKey {
            case calories
            case servingSize
            case fatContent
            case saturatedFatContent
            case transFatContent
            case cholesterolContent
            case sodiumContent
            case carbohydrateContent
            case fiberContent
            case sugarContent
            case proteinContent
        }

        var calories: NutritionValues?
        var servingSize: NutritionValues?
        var fatContent: NutritionValues?
        var saturatedFatContent: NutritionValues?
        var transFatContent: NutritionValues?
        var cholesterolContent: NutritionValues?
        var sodiumContent: NutritionValues?
        var carbohydrateContent: NutritionValues?
        var fiberContent: NutritionValues?
        var sugarContent: NutritionValues?
        var proteinContent: NutritionValues?
    }
}
