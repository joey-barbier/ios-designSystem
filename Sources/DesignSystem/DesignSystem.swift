//
//  DesignSystem.swift
//  DesignSystem
//
//  Created by Joey BARBIER on 18/11/2021.
//

import SwiftUI

public class DS {
    public struct Font {
        public private(set) var fontName: String
        public private(set) var size: CGFloat
        public private(set) var lineHeight: CGFloat
        public private(set) var alignment: TextAlignment
        
        public init(fontName: String,
                    size: CGFloat,
                    lineHeight: CGFloat,
                    alignment: TextAlignment)
        {
            self.fontName = fontName
            self.size = size
            self.lineHeight = lineHeight
            self.alignment = alignment
        }
    }
    
    public struct Button {
        public typealias Border = (color: Color, width: CGFloat, radius: CGFloat)
        
        public private(set) var backgroundColor: Color
        public private(set) var radius: CGFloat
        public private(set) var paddingVertical: CGFloat
        public private(set) var paddingHorizontal: CGFloat
        public private(set) var fontStyle: DS.Font
        public private(set) var clipShape: AnyShape?
        public private(set) var border: Border?
        public private(set) var width: CGFloat? = nil
        public private(set) var height: CGFloat? = nil
        public private(set) var alignment: Alignment
        
        public init(backgroundColor: Color = .clear,
                    radius: CGFloat = 0,
                    paddingVertical: CGFloat = 0,
                    paddingHorizontal: CGFloat = 0,
                    fontStyle: DS.Font,
                    clipShape: AnyShape? = nil,
                    border: Border? = nil,
                    width: CGFloat? = nil,
                    height: CGFloat? = nil,
                    alignment: Alignment = .center)
        {
            self.backgroundColor = backgroundColor
            self.radius = radius
            self.paddingVertical = paddingVertical
            self.paddingHorizontal = paddingHorizontal
            self.fontStyle = fontStyle
            self.clipShape = clipShape
            self.border = border
            self.width = width
            self.height = height
            self.alignment = alignment
        }
    }
}
