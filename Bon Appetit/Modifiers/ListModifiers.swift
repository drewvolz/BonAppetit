//
//  ListModifiers.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/3/20.
//

import SwiftUI

struct InsetGroupedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listStyle(InsetGroupedListStyle())
    }
}

struct InsetViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listStyle(InsetListStyle())
    }
}

extension List {
    func insetGroupedStyle() -> some View {
        modifier(InsetGroupedViewModifier())
    }
    
    func insetStyle() -> some View {
        modifier(InsetViewModifier())
    }
}

