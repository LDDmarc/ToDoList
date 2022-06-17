//
//  ToDoListContentProvider.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

final class ToDoListContentProvider: ContentProvider {
    @Published var tasks: [TaskModel] = []
    var tasksPublisher: Published<[TaskModel]>.Publisher { $tasks }
    
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        
        tasks = dataManager.get(type: [TaskModel].self, key: .todoList) ?? []
        print("dd")
    }
    
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
        dataManager.save(model: tasks, key: .todoList)
    }
}
