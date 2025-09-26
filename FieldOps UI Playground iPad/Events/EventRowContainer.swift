//
//  EventRowContainer.swift
//  FieldOps UI Playground
//
//  Created by Erik Loehfelm on 5/8/25.
//

import SwiftUI

struct EventRowContainer: View {
    let event: Event
    let index: Int
    let count: Int

    var body: some View {
        
        let shape = RoundedCornerShape(for: index, total: count, radius: 16)
        let leftShape = RoundedLeftCornersShape(for: index, total: count, radius: 16)
        
        HStack(spacing: 0) {
            Rectangle()
                .fill(event.status.color)
                .frame(width: 16)
                .clipShape(leftShape) // left-only corner radius
            
            EventRowContentView(event: event)
                .padding(.top, 12) // content padding inside the cell
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading) // fill list row width
        }
        .background(
            Color.clear
                .background(.regularMaterial)
                .clipShape(shape)
        )
        .contentShape(shape)
        .hoverEffect(.highlight)
        .listRowInsets(EdgeInsets())  // Remove default inset entirely
        .padding(.vertical, 4)        // vertical spacing between items
        .listRowSeparator(.hidden)    // removes the default divider
    }
}
