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
    private var updateAction: ((TaskModel) -> Void)?
    private var createAction: ((TaskModel) -> Void)?
    
    private var reserveModel = TaskModel(id: "_", name: "Default", description: "", priority: .medium)
    
    init(
        task: TaskModel,
        updateAction: @escaping (TaskModel) -> Void,
        createAction: @escaping (TaskModel) -> Void
    ) {
        self.task = task
        self.updateAction = updateAction
        self.createAction = createAction
    }
    
    func makeReserveCopy() {
        reserveModel.rename(name)
        reserveModel.setIsDone(newValue: isDone)
        reserveModel.changePriority(priority)
        reserveModel.setDescription(description)
    }
    
    func rollBack() {
        task.rename(reserveModel.name)
        task.setIsDone(newValue: reserveModel.isDone)
        task.changePriority(reserveModel.priority)
        task.setDescription(reserveModel.description ?? "")
    }
    
    func create() {
        createAction?(task)
    }
    
    func save() {
        updateAction?(task)
    }
}

