//
//  EventsView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/24/25.
//

import SwiftUI

struct EventsView: View {
    
    @State private var eventType = 0
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(eventSections) { section in
                    Section(header: Text(section.date.formatted(date: .long, time: .omitted))) {
                        ForEach(Array(section.group.enumerated()), id: \.1.id) { index, event in
                            Button {
                                // do something
                            } label: {
                                Text("\(event.name)")
//                                EventRowContainer(event: event, index: index, count: section.group.count)
                            }
//                            .buttonStyle(.plain)
//                            .listRowInsets(EdgeInsets())
//                            .listRowBackground(Color.clear)
//                            .listRowSeparator(.hidden)
                        }
                    }
                }
            }
            .padding(.top, 150) // control the position of the list from the top of the screen
            .ignoresSafeArea(edges: .top)
            .safeAreaInset(edge: .top, spacing: 0) {
                HeaderView(selectedSegment: $eventType, segments: ["Planned Events", "Unplanned Events"])
                    .padding(.top, 89) // control the position of the header buttons from the top
                    .background(.ultraThinMaterial, in: .rect)
//                    .glassEffect(in: .rect)
                    .ignoresSafeArea(edges: .top) // Extend background to top of screen
            }
        }
    }
}

#Preview {
    EventsView()
}
