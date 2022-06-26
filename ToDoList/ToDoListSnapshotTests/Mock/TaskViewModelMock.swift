//
//  TaskViewModelMock.swift
//  ToDoListSnapshotTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import Foundation
@testable import ToDoList

class TaskViewModelMock: TaskViewModelProtocol {
    var name: String = ""
    var isDone: Bool = false
    var description: String = ""
    var priority: Priority = .low
    var id: String = "1"
    
    func save() {}
    func create() {}
    func makeReserveCopy() {}
    func rollBack() {}
}
