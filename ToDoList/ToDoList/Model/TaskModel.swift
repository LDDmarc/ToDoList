//
//  TaskModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation

struct TaskModel: Codable {
    static let mock = TaskModel(id: "1", name: "Test", priority: .medium)
    static var new: TaskModel {
        TaskModel(id: UUID().uuidString, name: "", priority: .medium)
    }
    
    enum Priority: String, Codable, CaseIterable, Identifiable {
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
    }
    
    var id: String
    var name: String
    var description: String?
    var priority: Priority
    var isDone: Bool = false
    
    mutating func rename(_ newName: String) {
        name = newName
    }
    
    mutating func setIsDone(newValue: Bool) {
        isDone = newValue
    }
    
    mutating func setDescription(_ newDescriprion: String) {
        description = newDescriprion
    }
    
    mutating func changePriority(_ newValue: Priority) {
        print("changePriority")
        priority = newValue
    }
}
