//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

final class TaskListViewModel: ObservableObject {
    @Published var tasksViewModel: [TaskViewModel] = []
    lazy var newTaskViewModel = TaskViewModel(contentProvider: contentProvider, task: .new)
    
    private let contentProvider: ContentProvider
    
    @Published private var tasks: [TaskModel] = []
    private var cancellabels: Set<AnyCancellable> = Set()
    
    init(
        contentProvider: ContentProvider
    ) {
        self.contentProvider = contentProvider
        
        contentProvider.tasksPublisher
            .sink { [weak self] newTasks in
                guard let `self` = self else {
                    return
                }
                print("contentProvider.tasksPublisher")
                self.tasks = newTasks
                self.tasksViewModel = newTasks.compactMap { TaskViewModel(contentProvider: contentProvider, task: $0) }
            }
            .store(in: &cancellabels)
    }
    
    func deleteTasks(offsets: IndexSet) {
        contentProvider.deleteTasks(offsets: offsets)
    }
}

