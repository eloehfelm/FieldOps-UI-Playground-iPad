//
//  ContentView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem {
                    Label("Events", systemImage: "square.grid.2x2")
                }
            
            LibraryView()
                .tabItem {
                    Label("Library", systemImage: "photo.on.rectangle.angled")
                }
            
            VStack(spacing: 24) {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                HStack {
                    Text("Title 3")
                    Text("Events > SoFi Stadium")
                        .font(.title3)
                        .bold()
                }
                
                HStack {
                    Text("Title 2")
                    Text("Events > SoFi Stadium")
                        .font(.title2)
                        .bold()
                }
                
                HStack {
                    Text("Title 1")
                    Text("Events > SoFi Stadium")
                        .font(.title)
                        .bold()
                }
            }
            .padding()
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

#Preview {
    ContentView()
}
