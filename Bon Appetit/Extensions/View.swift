//
//  View.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/4/20.
//

import SwiftUI

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
