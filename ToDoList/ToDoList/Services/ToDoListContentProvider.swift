//
//  ToDoListContentProvider.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine
import SwiftUI

final class ToDoListContentProvider: ContentProvider {
    @Published var tasks: [TaskModelProtocol] = []
    var tasksPublisher: Published<[TaskModelProtocol]>.Publisher { $tasks }
    
    private let dataManager: DataManager
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        
        tasks = dataManager.get(type: [TaskModel].self, key: .todoList) ?? []
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveData), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func getTask(for id: String) -> TaskModelProtocol? {
        tasks.first(where: { $0.id == id })
    }
    
    func addTask(
        newModel: TaskModelProtocol
    ) {
        tasks.append(newModel)
    }
    
    func updateTask(
        newModel: TaskModelProtocol
    ) {
        guard let taskIndex = tasks.firstIndex(where: { $0.id == newModel.id }) else { return }
        tasks[taskIndex] = newModel
    }
    
    func deleteTasks(offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    @objc
    private func saveData() {
        guard let tasks = tasks as? [TaskModel] else { return }
        dataManager.save(model: tasks, key: .todoList)
    }
}
