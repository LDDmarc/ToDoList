//
//  ContentProviderMock.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 26.06.2022.
//

import Foundation
import Combine
@testable import ToDoList

class ContentProviderMock: ContentProvider {
    @Published var tasks: [TaskModelProtocol] = TaskModelsMockProvider.tasks
    var tasksPublisher: Published<[TaskModelProtocol]>.Publisher { $tasks }
    
    func getTask(for id: String) -> TaskModelProtocol? {
        tasks.first(where: { $0.id == id })
    }
    
    func addTask(newModel: TaskModelProtocol) {
        tasks.append(newModel)
    }
    
    func updateTask(newModel: TaskModelProtocol) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == newModel.id }) else {
            return
        }
        tasks[taskIndex] = newModel
    }
    
    func deleteTasks(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
