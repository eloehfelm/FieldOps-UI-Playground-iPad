//
//  LocationRow.swift
//  FieldOps UI Playground iPad
//
//  Created by Erik Loehfelm on 9/17/25.
//

import SwiftUI

struct LocationRow: View {
    let title: String
    let subtitle: String
    var additionalInfo: String? = nil
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
                .frame(width: 32, height: 32)
                .background(color)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                
                if let additionalInfo = additionalInfo {
                    HStack(alignment: .top, spacing: 20) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(subtitle.components(separatedBy: "\n").first ?? "")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)
                            
                            Text(subtitle.components(separatedBy: "\n").dropFirst().joined(separator: "\n"))
                                .font(.system(size: 13))
                                .foregroundColor(.primary)
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(additionalInfo.components(separatedBy: "\n").first ?? "")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.secondary)
                                .textCase(.uppercase)
                            
                            Text(additionalInfo.components(separatedBy: "\n").dropFirst().joined(separator: "\n"))
                                .font(.system(size: 13))
                                .foregroundColor(.primary)
                        }
                    }
                } else {
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
            }
            
            Spacer()
            
            Button(action: {
                // More options
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.secondary)
                    .font(.system(size: 16, weight: .medium))
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}