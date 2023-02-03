//
//  Text+DesignSystem.swift
//  DesignSystem
//
//  Created by Joey BARBIER on 22/11/2021.
//

import SwiftUI

public extension View {
    func designSystem(font style: DS.Font) -> some View {
        self
            .font(.custom(style.fontName, size: style.size))
            .multilineTextAlignment(style.alignment)
            .lineSpacing(style.size - style.lineHeight)
    }
    
    @ViewBuilder
    func designSystem(button style: DS.Button) -> some View {
        self
            .designSystem(font: style.fontStyle)
            .frame(width: style.width,
                   height: style.height,
                   alignment: style.alignment)
            .padding(.vertical, style.paddingVertical)
            .padding(.horizontal, style.paddingHorizontal)
            .background(style.backgroundColor)
            .cornerRadius(style.radius)
            .if(style.border != nil){ content in
                content.overlay(
                    RoundedRectangle(cornerRadius: style.border!.radius)
                        .stroke(style.border!.color,
                                lineWidth: style.border!.width)
                        .frame(width: style.width,
                               height: style.height,
                               alignment: style.alignment)
                )
            }
            .if(style.clipShape != nil) { content in
                content.clipShape(style.clipShape!)
            }
    }
}
