//
//  HeaderView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI

struct EventsHeaderView: View {
    @Binding var selectedSegment: Int
    let segments: [String]
    
    // look into a 'pinned accessory view' under a toolbar for the header content to apply the
    // scroll edge effect
    
    var body: some View {
        HStack {
            // Left side - Segmented control
            Picker("Content Type", selection: $selectedSegment) {
                ForEach(0..<segments.count, id: \.self) { index in
                    Text(segments[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(maxWidth: 400)
            
            Spacer()
            
            // Right side - Buttons
            HStack(spacing: 16) {
                // CommandAssist button
                Button {
                    print("assist pressed")
                } label: {
                    Label("CommandAssist", systemImage: "apple.intelligence")
                }
                .buttonStyle(.borderedProminent)
                
                // Separator
                Divider()
                    .frame(height: 24)
                
                HStack(spacing: 8) {
                    // New Event button
                    Button {
                        print("new event pressed")
                    } label: {
                        Label("New Event", systemImage: "plus")
                    }
                    .buttonStyle(.bordered)
                    .background(Color.secondary)
                    .clipShape(Capsule())
                    
                    // Search button
                    Button {
                        print("search pressed")
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .buttonStyle(.bordered)
                    .background(Color.secondary)
                    .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 14)
        .padding(.top, 0)
        .overlay(
            Rectangle()
                .frame(height: 1, alignment: .bottom) // Adjust height for border thickness, alignment for desired side
                .foregroundColor(.gray.opacity(0.5)),
            alignment: .bottom // Adjust alignment for desired side (e.g., .top, .leading, .trailing)
        )
    }
}
