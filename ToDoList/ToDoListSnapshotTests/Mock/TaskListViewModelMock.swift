//
//  TaskListViewModelMock.swift
//  ToDoListSnapshotTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import Foundation
@testable import ToDoList

class TaskListViewModelMock: TaskListViewModelProtocol {
    @Published var tasksViewModel: [TaskViewModel] = []
    var newTaskViewModel: TaskViewModel = TaskViewModel(
        task: TaskModelsMockProvider.tasks[0],
        updateAction: { _ in },
        createAction: { _ in }
    )
    
    func deleteTasks(offsets: IndexSet) { }
}
