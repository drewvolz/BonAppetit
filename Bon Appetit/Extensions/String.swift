//
//  String.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

extension String {
    func uppercaseFirst() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func uppercaseFirst() {
        self = uppercaseFirst()
    }
}
