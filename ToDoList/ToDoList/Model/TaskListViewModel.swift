//
//  TaskListViewModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

// MAIN APP VIEW MODEL
/// Есть старшая вью модель, и у нее есть младшие. Младшие ничего не умеюют, просят старшую заниматься их делишками (через updateAction, например) О своих изменениях они банально через  @Published говорят
/// Старшая моделька общается с сервисами (ContentProvider)
///

protocol TaskListViewModelProtocol: ObservableObject {
    associatedtype Model: TaskViewModelProtocol
    var tasksViewModel: [Model] { get set }
    var newTaskViewModel: Model { get }
    func deleteTasks(offsets: IndexSet)
}

final class TaskListViewModel: TaskListViewModelProtocol {
    @Published var tasksViewModel: [TaskViewModel] = []
    
    var newTaskViewModel: TaskViewModel {
        TaskViewModel(
            task: TaskModel(id: UUID().uuidString, name: "", priority: .medium),
            updateAction: updateAction,
            createAction: createAction
        )
    }
    
    private let contentProvider: ContentProvider
    private var cancellabels: Set<AnyCancellable> = Set()
    
    private lazy var updateAction: (TaskModelProtocol) -> Void = { [weak self] task in
        self?.contentProvider.updateTask(newModel: task)
    }
    
    private lazy var createAction: (TaskModelProtocol) -> Void = { [weak self] task in
        self?.contentProvider.addTask(newModel: task)
    }
    
    init(
        contentProvider: ContentProvider
    ) {
        self.contentProvider = contentProvider
        
        contentProvider.tasksPublisher
            .sink { [weak self] newTasks in
                guard let `self` = self else { return }
                self.tasksViewModel = newTasks.compactMap { TaskViewModel(
                    task: $0,
                    updateAction: self.updateAction,
                    createAction: self.createAction
                )}
            }
            .store(in: &cancellabels)
    }
    
    func deleteTasks(offsets: IndexSet) {
        contentProvider.deleteTasks(offsets: offsets)
    }
}

