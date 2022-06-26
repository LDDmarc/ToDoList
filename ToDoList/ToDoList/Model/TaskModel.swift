//
//  TaskModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation

protocol TaskModelProtocol: Codable {
    var id: String { get }
    var name: String { get }
    var description: String? { get }
    var priority: Priority { get }
    var isDone: Bool { get }
    
    mutating func rename(_ newName: String)
    mutating func setIsDone(newValue: Bool)
    mutating func setDescription(_ newDescriprion: String)
    mutating func changePriority(_ newValue: Priority)
}

struct TaskModel: TaskModelProtocol {
    static func makeNewEmptyModel() -> TaskModel {
        TaskModel(id: UUID().uuidString, name: "", priority: .medium)
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
        priority = newValue
    }
}
