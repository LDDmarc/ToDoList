//
//  Priority.swift
//  ToDoList
//
//  Created by Дарья Леонова on 26.06.2022.
//

import Foundation

protocol DescriptionProviding {
    var description: String { get }
}

enum Priority: String, Codable, CaseIterable, Identifiable, DescriptionProviding {
    case critical
    case high
    case medium
    case low
    
    var id: Self { self }
    
    var emoji: String {
        switch self {
        case .critical:
            return "🔥"
        case .high:
            return "🤯"
        case .medium:
            return "🔜"
        case .low:
            return "🛋"
        }
    }
    
    var description: String { emoji }
}
