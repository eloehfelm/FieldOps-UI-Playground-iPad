//
//  EventRow.swift
//  FieldOps UI Playground
//
//  Created by Erik Loehfelm on 5/8/25.
//

import SwiftUI

struct EventRowContentView: View {
    var event: Event
    
    @State private var showingSettings = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 24) {
            // left side
            // title
            VStack(alignment: .leading) {
                Text(event.name)
                    .font(.title2)
                    .bold()
                    .padding(0)

                
                Divider()
                
                // author and edit time
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 2) {
                            Text(Image(systemName: "person"))
                            Text("AUTHOR")
                        }
                        .foregroundColor(.secondary)
                        .font(.caption)
                        
                        Text(event.author)
                            .foregroundColor(.primary)
                            .font(.footnote)
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 2) {
                            Text(Image(systemName: "pencil"))
                            Text("EDITED")
                        }
                        .foregroundColor(.secondary)
                        .font(.caption)
                        
                        Text(event.timeEdited.formattedMilitaryDate)
                            .foregroundColor(.primary)
                            .font(.footnote)
                    }
                }
                .padding(.top, 4)
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            // right side
            VStack(alignment: .leading) {
                Spacer()
                
                // juristictions
                HStack {
                    ForEach(event.organizations) { org in
                        Text(org.name)
                            .font(.footnote)
                            .lineLimit(1)                      // force single-line
                            .truncationMode(.tail)            // default: ellipsis
                            .fixedSize(horizontal: false, vertical: true) // prevent height expansion
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(Color.secondary.opacity(0.15))
                            )
                    }
                }
//                .padding(.bottom, 4)
                
                Divider()
                
                
                // times
                HStack(spacing: 16) {
                    // from time
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 2) {
                            Text(Image(systemName: "clock"))
                            Text("FROM")
                        }
                        .foregroundColor(.secondary)
                        .font(.caption)
                        
                        Text(event.timeFrom.formattedMilitaryDate)
                            .foregroundColor(.primary)
                            .font(.footnote)
                    }
                    
                    // to time
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 2) {
                            Text(Image(systemName: "clock"))
                            Text("TO")
                        }
                        .foregroundColor(.secondary)
                        .font(.caption)
                        
                        Text(event.timeTo.formattedMilitaryDate)
                            .foregroundColor(.primary)
                            .font(.footnote)
                    }
                    
                    Divider()
                    
                    // OCN
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 2) {
                            Text(Image(systemName: "text.document"))
                            Text("OCN")
                        }
                        .foregroundColor(.secondary)
                        .font(.caption)
                        
                        Text(event.ocn)
                            .foregroundColor(.primary)
                            .font(.footnote)
                    }
                }
                .padding(.top, 4)
            }
            
            // these spacers push the button to the middle of the HStack

                VStack {
                    Spacer()
                    
                    Button {
                        print("settings button pressed")
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                    .buttonBorderShape(.circle)
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity)
                
                // chevron
                VStack {
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity)

        }
    }
}

extension Date {
    var formattedMilitaryDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy HH:mm"
        return formatter.string(from: self)
    }
}

//#Preview {
//    EventRow(event: events[0])
//}
