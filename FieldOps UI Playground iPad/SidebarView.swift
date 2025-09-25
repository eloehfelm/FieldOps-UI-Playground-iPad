//
//  SidebarView.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI

struct SidebarView: View {
    @State private var searchText = ""
    let headerHeight: CGFloat
    
    var body: some View {
        NavigationStack {
            List {
                // Recents section
                Section {
                    ForEach(0..<3, id: \.self) { index in
                        LocationRow(
                            title: "5914 Washington St, Wes",
                            subtitle: "Marked Location",
                            icon: "mappin.circle.fill",
                            color: .red
                        )
                        .listRowBackground(Color.clear)
                    }
                } header: {
                    Text("Recents")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.primary)
                        .textCase(nil)
                        .padding(.bottom, 8)
                }
                .listSectionSeparator(.hidden)
                
                // Saved Locations section
                Section {
                    LocationRow(
                        title: "LA Coliseum",
                        subtitle: "AREA\n2.6 sq miles",
                        additionalInfo: "CENTER\n34.161°, 118.167°",
                        icon: "building.2.crop.circle.fill",
                        color: .orange
                    )
                    .listRowBackground(Color.clear)
                    
                    ForEach(0..<4, id: \.self) { index in
                        LocationRow(
                            title: "5914 Washington St, Wes",
                            subtitle: "Marked Location",
                            icon: "building.2.crop.circle.fill",
                            color: .orange
                        )
                        .listRowBackground(Color.clear)
                    }
                } header: {
                    Text("Saved Locations")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.primary)
                        .textCase(nil)
                        .padding(.bottom, 8)
                }
                .listSectionSeparator(.hidden)
            }
            .listStyle(.grouped)
//            .scrollContentBackground(.hidden)
            .searchable(text: $searchText, prompt: "Search Map")
            .toolbar {
                // Reposition the search item to ensure it appears full width
                ToolbarItem(placement: .principal) {
                    EmptyView() // This helps ensure the search bar appears in the navigation area
                }
            }
        }
        
        .frame(maxWidth: 400)
//        .padding(.leading, 24)
//        .padding(.top, headerHeight + 24)
//        .padding(.bottom, 24)
        .glassEffect(in: RoundedRectangle(cornerRadius: 32.0))
    }
}
