//
//  DataManager.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation

enum DataKey {
    case todoList
    case task(id: String)
    
    var stringValue: String {
        switch self {
        case .todoList:
            return "todo_list"
        case .task(let id):
            return "task_id\(id)"
        }
    }
}

protocol DataManager {
    func save<T: Codable>(model: T, key: DataKey)
    func get<T: Codable>(type: T.Type, key: DataKey) -> T?
}
