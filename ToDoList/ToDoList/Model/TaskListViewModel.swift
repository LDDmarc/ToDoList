//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

// MAIN APP VIEW MODEL
final class TaskListViewModel: ObservableObject {
    @Published var tasksViewModel: [TaskViewModel] = []
    
    var newTaskViewModel: TaskViewModel {
        TaskViewModel(
            task: TaskModel(id: UUID().uuidString, name: "", priority: .medium),
            updateAction: updateAction,
            createAction: createAction
        )
    }
    
    private let contentProvider: ContentProvider
    
    @Published private var tasks: [TaskModel] = []
    private var cancellabels: Set<AnyCancellable> = Set()
    
    private lazy var updateAction: (TaskModel) -> Void = { [weak self] task in
        self?.contentProvider.updateTask(newModel: task)
    }
    
    private lazy var createAction: (TaskModel) -> Void = { [weak self] task in
        self?.contentProvider.addTask(newModel: task)
    }
    
    init(
        contentProvider: ContentProvider
    ) {
        self.contentProvider = contentProvider
        
        contentProvider.tasksPublisher
            .sink { [weak self] newTasks in
                guard let `self` = self else {
                    return
                }
                self.tasksViewModel = newTasks.compactMap { TaskViewModel(
                    task: $0,
                    updateAction: self.updateAction,
                    createAction: self.createAction
                )}
                self.tasks = newTasks
            }
            .store(in: &cancellabels)
    }
    
    func deleteTasks(offsets: IndexSet) {
        contentProvider.deleteTasks(offsets: offsets)
    }
}

