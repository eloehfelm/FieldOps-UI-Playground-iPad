//
//  RoundedCornerShape.swift
//  FieldOps UI Playground
//
//  Created by Erik Loehfelm on 5/8/25.
//

import SwiftUI

struct RoundedCornerShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    init(for index: Int, total: Int, radius: CGFloat = 16) {
        self.radius = radius

        if index == 0 && index == total - 1 {
            self.corners = [.allCorners]
        } else if index == 0 {
            self.corners = [.topLeft, .topRight]
        } else if index == total - 1 {
            self.corners = [.bottomLeft, .bottomRight]
        } else {
            self.corners = []
        }
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
