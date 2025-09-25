//
//  HeaderView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI

struct HeaderView: View {
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
            HStack(spacing: 12) {
                // CommandAssist button
                Button(action: {
                    // CommandAssist action
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "waveform.and.mic")
                            .font(.system(size: 15, weight: .regular))
                        Text("CommandAssist1")
                            .font(.system(size: 15, weight: .regular))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 7)
                    .background(Color.blue)
                    .clipShape(Capsule())
                }
                
                Button("CommandAssist2") {
                    // action here
                }
                .buttonStyle(.borderedProminent)
                
                Button {
                    print("assist pressed")
                } label: {
                    Label("CommandAssist3", systemImage: "waveform.badge.microphone")
                }
                .buttonStyle(.borderedProminent)
                
                // Separator
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 1, height: 24)
                
                // New Event button
                Button(action: {
                    // New Event action
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: "plus")
                            .font(.system(size: 12, weight: .medium))
                        Text("New Event")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .foregroundColor(.primary)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.white.opacity(0.9))
                    .clipShape(Capsule())
                }
                
                // Search button
                Button(action: {
                    // Search action
                }) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.primary)
                        .padding(8)
                        .background(Color.white.opacity(0.9))
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }
}
