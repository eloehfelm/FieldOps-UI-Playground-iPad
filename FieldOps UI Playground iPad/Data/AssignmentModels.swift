//
//  AssignmentModels.swift
//  FieldOps UI Playground
//
//  Created by Erik Loehfelm on 8/24/25.
//

import Foundation
import SwiftUI

struct Assignment: Identifiable, Hashable, Codable {
    let id = UUID()
    let name: String
    let branch: String // Planning, Operations, etc.
    let division: DivisionColor // Red, Gold, etc.
    let group: String // Situation Unit, etc.
    let category: AssignmentCategory
    let instructions: [AssignmentInstruction]
    let children: [Assignment]?
    let isGroup: Bool
    
    // Unit Summary
    let personnelTypes: [String] // Deputy, Commander, Staff
    let location: String
    let assignmentBoundary: AssignmentBoundary?
    let assignmentEquipment: [String] // Radio car, etc.
    let mobTime: String // Military time
    let supervisor: String? // Name of supervisor assignment
    let directReports: [String] // Names of direct report assignments
    
    // Assigned Personnel
    let assignedPersonnel: [AssignedPerson]
    
    init(name: String,
         branch: String = "",
         division: DivisionColor = .none,
         group: String = "",
         category: AssignmentCategory,
         instructions: [AssignmentInstruction] = [],
         children: [Assignment]? = nil,
         personnelTypes: [String] = [],
         location: String = "",
         assignmentBoundary: AssignmentBoundary? = nil,
         assignmentEquipment: [String] = [],
         mobTime: String = "",
         supervisor: String? = nil,
         directReports: [String] = [],
         assignedPersonnel: [AssignedPerson] = []) {
        self.name = name
        self.branch = branch
        self.division = division
        self.group = group
        self.category = category
        self.instructions = instructions
        self.children = children
        self.isGroup = children != nil
        self.personnelTypes = personnelTypes
        self.location = location
        self.assignmentBoundary = assignmentBoundary
        self.assignmentEquipment = assignmentEquipment
        self.mobTime = mobTime
        self.supervisor = supervisor
        self.directReports = directReports
        self.assignedPersonnel = assignedPersonnel
    }
    
    // Custom coding keys to exclude id from JSON
    enum CodingKeys: String, CodingKey {
        case name, branch, division, group, category, instructions, children
        case personnelTypes, location, assignmentBoundary, assignmentEquipment
        case mobTime, supervisor, directReports, assignedPersonnel
    }
    
    // Custom decoder that generates UUID
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        branch = try container.decode(String.self, forKey: .branch)
        division = try container.decode(DivisionColor.self, forKey: .division)
        group = try container.decode(String.self, forKey: .group)
        category = try container.decode(AssignmentCategory.self, forKey: .category)
        instructions = try container.decode([AssignmentInstruction].self, forKey: .instructions)
        children = try container.decodeIfPresent([Assignment].self, forKey: .children)
        personnelTypes = try container.decode([String].self, forKey: .personnelTypes)
        location = try container.decode(String.self, forKey: .location)
        assignmentBoundary = try container.decodeIfPresent(AssignmentBoundary.self, forKey: .assignmentBoundary)
        assignmentEquipment = try container.decode([String].self, forKey: .assignmentEquipment)
        mobTime = try container.decode(String.self, forKey: .mobTime)
        supervisor = try container.decodeIfPresent(String.self, forKey: .supervisor)
        directReports = try container.decode([String].self, forKey: .directReports)
        assignedPersonnel = try container.decode([AssignedPerson].self, forKey: .assignedPersonnel)
        
        isGroup = children != nil
    }
    
    // Custom encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(branch, forKey: .branch)
        try container.encode(division, forKey: .division)
        try container.encode(group, forKey: .group)
        try container.encode(category, forKey: .category)
        try container.encode(instructions, forKey: .instructions)
        try container.encodeIfPresent(children, forKey: .children)
        try container.encode(personnelTypes, forKey: .personnelTypes)
        try container.encode(location, forKey: .location)
        try container.encodeIfPresent(assignmentBoundary, forKey: .assignmentBoundary)
        try container.encode(assignmentEquipment, forKey: .assignmentEquipment)
        try container.encode(mobTime, forKey: .mobTime)
        try container.encodeIfPresent(supervisor, forKey: .supervisor)
        try container.encode(directReports, forKey: .directReports)
        try container.encode(assignedPersonnel, forKey: .assignedPersonnel)
    }
    
    // Implement Equatable
    static func == (lhs: Assignment, rhs: Assignment) -> Bool {
        return lhs.id == rhs.id
    }
    
    // Implement Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Supporting Structures
enum DivisionColor: String, Codable, CaseIterable {
    case red = "Red"
    case gold = "Gold"
    case blue = "Blue"
    case green = "Green"
    case purple = "Purple"
    case none = "None"
    
    var color: Color {
        switch self {
        case .red: return .red
        case .gold: return .yellow
        case .blue: return .blue
        case .green: return .green
        case .purple: return .purple
        case .none: return .gray
        }
    }
}

enum AssignmentCategory: String, Codable {
    case individual = "individual"
    case group = "group"
    case category = "category"
    
    var iconName: String {
        switch self {
        case .individual: return "person.circle"
        case .group: return "person.3"
        case .category: return "folder"
        }
    }
}

struct AssignmentBoundary: Codable {
    let northEast: Coordinate
    let southWest: Coordinate
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

struct AssignedPerson: Identifiable, Codable, Hashable {
    let id = UUID()
    let assignmentName: String // Red Frank Sam
    let firstName: String // William
    let lastName: String // Smith
    let rank: String // Lieutenant
    let badgeNumber: String // 123456789
    let phoneNumber: String // 987-654-3210
    let specializations: [String] // List of specializations
    let mobTime: String // 1400
    let checkInTime: String // 1350
    let demobTime: String // 0400
    let status: PersonStatus
    
    enum CodingKeys: String, CodingKey {
        case assignmentName, firstName, lastName, rank, badgeNumber
        case phoneNumber, specializations, mobTime, checkInTime, demobTime, status
    }
    
    // Custom decoder that generates UUID
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        assignmentName = try container.decode(String.self, forKey: .assignmentName)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        rank = try container.decode(String.self, forKey: .rank)
        badgeNumber = try container.decode(String.self, forKey: .badgeNumber)
        phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        specializations = try container.decode([String].self, forKey: .specializations)
        mobTime = try container.decode(String.self, forKey: .mobTime)
        checkInTime = try container.decode(String.self, forKey: .checkInTime)
        demobTime = try container.decode(String.self, forKey: .demobTime)
        status = try container.decode(PersonStatus.self, forKey: .status)
    }
    
    // Custom encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(assignmentName, forKey: .assignmentName)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(rank, forKey: .rank)
        try container.encode(badgeNumber, forKey: .badgeNumber)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(specializations, forKey: .specializations)
        try container.encode(mobTime, forKey: .mobTime)
        try container.encode(checkInTime, forKey: .checkInTime)
        try container.encode(demobTime, forKey: .demobTime)
        try container.encode(status, forKey: .status)
    }
    
    static func == (lhs: AssignedPerson, rhs: AssignedPerson) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum PersonStatus: String, Codable, CaseIterable {
    case assigned = "assigned"
    case mobilized = "mobilized"
    case checkedIn = "checked_in"
    case demobilized = "demobilized"
    case available = "available"
    
    var color: Color {
        switch self {
        case .assigned: return .blue
        case .mobilized: return .orange
        case .checkedIn: return .green
        case .demobilized: return .gray
        case .available: return .cyan
        }
    }
}

struct AssignmentInstruction: Identifiable, Codable {
    let id = UUID()
    let title: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case title, content
    }
    
    // Custom decoder that generates UUID
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        content = try container.decode(String.self, forKey: .content)
    }
    
    // Custom encoder
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(title, forKey: .title)
        try container.encode(content, forKey: .content)
    }
}
