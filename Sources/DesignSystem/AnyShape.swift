//
//  AnyShape.swift
//  DesignSystem
//
//  Created by Joey BARBIER on 17/11/2021.
//

import SwiftUI

public struct AnyShape: Shape {
    public var make: (CGRect, inout Path) -> ()
    
    public init(_ make: @escaping (CGRect, inout Path) -> ()) {
        self.make = make
    }
    
    public init<S: Shape>(_ shape: S) {
        self.make = { rect, path in
            path = shape.path(in: rect)
        }
    }
    
    public func path(in rect: CGRect) -> Path {
        return Path { [make] in make(rect, &$0) }
    }
}
