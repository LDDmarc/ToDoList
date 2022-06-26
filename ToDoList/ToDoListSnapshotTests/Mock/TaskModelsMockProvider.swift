//
//  TaskModelsMockProvider.swift
//  ToDoListSnapshotTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import Foundation
@testable import ToDoList

final class TaskModelsMockProvider {
    static let tasks = [
        TaskModel(
            id: "1",
            name: "Test_1",
            description: nil,
            priority: .critical,
            isDone: false
        ),
        TaskModel(
            id: "2",
            name: "Test_2",
            description: "Some description",
            priority: .critical,
            isDone: false
        ),
        TaskModel(
            id: "3",
            name: "Test_3",
            description: "Some description",
            priority: .medium,
            isDone: false
        ),
        TaskModel(
            id: "4",
            name: "Test_4",
            description: nil,
            priority: .low,
            isDone: false
        ),
        TaskModel(
            id: "5",
            name: "Test_5",
            description: nil,
            priority: .high,
            isDone: false
        ),
        TaskModel(
            id: "6",
            name: "Test_6",
            description: "Biehioeior hwvbboh ugowebcow wegiwjbcjqviufgi2v cfjweb",
            priority: .low,
            isDone: false
        ),
        TaskModel(
            id: "7",
            name: "Test_7",
            description: "oi    f8c9w b cg9ufb ojw gwwben wo'bfi wnwo;bcdb wekw",
            priority: .low,
            isDone: false
        ),
        TaskModel(
            id: "8",
            name: "Test_8",
            description: nil,
            priority: .high,
            isDone: false
        ),
    ]
    
    static var viewModels: [TaskViewModel] {
        tasks.compactMap { TaskViewModel(task: $0, updateAction: { _ in }, createAction: { _ in }) }
    }
}
