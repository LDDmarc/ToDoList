//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Combine

final class TaskViewModel: ObservableObject {
    var name: String {
        get { task.name }
        set { task.rename(newValue) }
    }
    
    var isDone: Bool {
        get { task.isDone }
        set { task.setIsDone(newValue: newValue) }
    }
    
    var description: String {
        get { task.description ?? "" }
        set { task.setDescription(newValue) }
    }
    
    var priority: TaskModel.Priority {
        get { task.priority }
        set { task.changePriority(newValue) }
    }
    
    var id: String { task.id }
    
    @Published private var task: TaskModel
    private var reserveModel: TaskModel
    private var cancellabels: Set<AnyCancellable> = Set()
    
    private let contentProvider: ContentProvider
    
    init(
        contentProvider: ContentProvider,
        task: TaskModel
    ) {
        self.contentProvider = contentProvider
        self.task = task
        self.reserveModel = task
        
        var isInit = true
        $task
            .sink { [weak self] newModel in
                guard !isInit else {
                    isInit = false
                    return
                }
                guard let `self` = self else {
                    return
                }
                print("TaskVM contentProvider.updateTask")
                self.contentProvider.updateTask(newModel: newModel)
            }
            .store(in: &cancellabels)
    }
    
    func makeReserveCopy() {
        reserveModel = TaskModel(id: task.id, name: name, description: description, priority: priority, isDone: isDone)
    }
    
    func rollBack() {
        isDone = reserveModel.isDone
        name = reserveModel.name
        description = reserveModel.description ?? " "
        priority = reserveModel.priority
    }
    
    func create() {
        contentProvider.addTask(newModel: task)
    }
}

