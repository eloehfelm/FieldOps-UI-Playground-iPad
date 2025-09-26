//
//  RoundedLeftCornersShape.swift
//  FieldOps UI Playground
//
//  Created by Erik Loehfelm on 5/8/25.
//

import SwiftUI

struct RoundedLeftCornersShape: Shape {
    let isTop: Bool
    let isBottom: Bool
    let radius: CGFloat

    init(for index: Int, total: Int, radius: CGFloat = 16) {
        self.radius = radius
        self.isTop = index == 0
        self.isBottom = index == total - 1
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let tl = isTop ? radius : 0
        let bl = isBottom ? radius : 0

        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX + tl, y: rect.minY))
        if tl > 0 {
            path.addArc(
                center: CGPoint(x: rect.minX + tl, y: rect.minY + tl),
                radius: tl,
                startAngle: .degrees(-90),
                endAngle: .degrees(-180),
                clockwise: true
            )
        } else {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }

        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - bl))
        if bl > 0 {
            path.addArc(
                center: CGPoint(x: rect.minX + bl, y: rect.maxY - bl),
                radius: bl,
                startAngle: .degrees(-180),
                endAngle: .degrees(-270),
                clockwise: true
            )
        } else {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }

        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}
