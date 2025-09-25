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
            .safeAreaPadding(.top, 50)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Picker("Event Type?", selection: $eventType) {
                        Text("Planned Events").tag(0)
                        Text("Unplanned Events").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .fixedSize()
                }
                
                
                ToolbarSpacer(.flexible)

                ToolbarItem {
                    Button {
                        // do something
                    } label: {
                        Text("CommandAssist")
//                        Label {
//                            Text("CommandAssist")
//                        } icon: {
//                            Image(systemName: "waveform.badge.microphone")
//                        }
                    }
                    .buttonStyle(.glassProminent)
                }

                ToolbarSpacer(.fixed)
                
                ToolbarItemGroup {
                    Button {
                        // do something
                    } label: {
                        Image(systemName: "eraser.badge.xmark")
                    }

                    Button {
                        // do something
                    } label: {
                        Image(systemName: "tray.badge")
                    }
                }
                
                ToolbarSpacer(.fixed)
            
                ToolbarItem {
                    Button {
                        // do something
                    } label: {
                        Image(systemName: "1.calendar")
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        // do something
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                HStack {
                    Button {
                        // do something
                    } label: {
                        Image(systemName: "plus")
                    }
//                    .buttonBorderShape(.capsule)
                    .buttonStyle(.glassProminent)
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
//                .background(.bar)
            }
            .scrollEdgeEffectStyle(.soft, for: .top)
            
            
        }
        .safeAreaInset(edge: .top) {
            VStack(alignment: .leading, spacing: 8) {
                HStack() {
                    Button {
                        //do something
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                    .buttonBorderShape(.capsule)
                    .buttonStyle(.bordered)

                    Spacer()
                        Text("hello")
                    Spacer()
                    
                }
               HStack {
                     Button("Button") { }
//                       .buttonBorderShape(.capsule)
                       .buttonStyle(.bordered)
                     Button("Button") { }
//                       .buttonBorderShape(.capsule)
                       .buttonStyle(.bordered)
                     Button("Button") { }
//                       .buttonBorderShape(.capsule)
                       .buttonStyle(.bordered)
                     Spacer()
                   }
            }
            .padding()
            .scrollEdgeEffectStyle(.hard, for: .top)
        }
        
    }
}

#Preview {
    EventsView()
}
