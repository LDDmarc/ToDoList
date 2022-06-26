//
//  TaskModelMock.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import Foundation
@testable import ToDoList

struct TaskModelMock: TaskModelProtocol {
    var id: String = "1"
    var name: String = "Name"
    var description: String? = nil
    var priority: Priority = .medium
    var isDone: Bool = false
    
    mutating func rename(_ newName: String) { name = newName }
    mutating func setIsDone(newValue: Bool) { isDone = newValue }
    mutating func setDescription(_ newDescriprion: String) { description = newDescriprion }
    mutating func changePriority(_ newValue: Priority) { priority = newValue }
}
