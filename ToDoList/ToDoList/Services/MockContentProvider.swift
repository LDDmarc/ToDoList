//
//  MockContentProvider.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

final class MockContentProvider: ContentProvider {
    @Published var tasks: [TaskModel] = [
        TaskModel(id: "1", name: "Dishes Boom", priority: .high),
        TaskModel(id: "2", name: "Home work", description: "bul bul bul", priority: .critical),
        TaskModel(id: "3", name: "Call John", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum", priority: .medium)
    ]
    
    var tasksPublisher: Published<[TaskModel]>.Publisher { $tasks }
    
    private var cancellabels: Set<AnyCancellable> = Set()
    
    func getTask(for id: String) -> TaskModel? {
        tasks.first(where: { $0.id == id })
    }
    
    func addTask(
        newModel: TaskModel
    ) {
        tasks.append(newModel)
    }
    
    func updateTask(
        newModel: TaskModel
    ) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == newModel.id }) else { return }
        tasks[taskIndex] = newModel
    }
    
    func deleteTasks(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
