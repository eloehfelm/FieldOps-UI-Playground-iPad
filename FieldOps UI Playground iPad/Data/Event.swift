//
//  Event.swift
//  FieldOps UI Playground
//
//  Created by Erik Loehfelm on 5/8/25.
//

import Foundation
import SwiftUI

enum Status: String, Codable {
    case red, yellow, green, cyan
}

extension Status {
    var color: Color {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        case .cyan: return .cyan
        }
    }
}

struct EventSection: Codable, Identifiable {
    var id: UUID { UUID() } // Unique ID for use in ForEach
    var date: Date
    var group: [Event]
}

struct Event: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var author: String
    var timeEdited: Date
    var timeFrom: Date
    var timeTo: Date
    var ocn: String
    var organizations: [Organization]
    var status: Status
    var assignments: [Assignment]
    
    // Custom coding keys
    enum CodingKeys: String, CodingKey {
        case id, name, author, timeEdited, timeFrom, timeTo, ocn, organizations, status, assignments
    }
}

struct Organization: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
}
