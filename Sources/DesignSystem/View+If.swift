//
//  Button+DesignSystem.swift
//  GEO
//
//  Created by Joey BARBIER on 18/11/2021.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
