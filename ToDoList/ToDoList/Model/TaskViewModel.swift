//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Combine

protocol TaskViewModelProtocol: ObservableObject, Identifiable {
    var name: String { get set }
    var isDone: Bool { get set }
    var description: String { get set }
    var priority: Priority { get set }
    var id: String { get }
    
    func save()
    func create()
    func makeReserveCopy()
    func rollBack()
}

final class TaskViewModel: TaskViewModelProtocol {
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
    
    var priority: Priority {
        get { task.priority }
        set { task.changePriority(newValue) }
    }
    
    var id: String {
        task.id
    }
    
    @Published private var task: TaskModelProtocol
    private var updateAction: ((TaskModelProtocol) -> Void)?
    private var createAction: ((TaskModelProtocol) -> Void)?
    
    private var reserveModel = TaskModel(
        id: "_",
        name: "Default",
        description: nil,
        priority: .medium
    )
    
    init(
        task: TaskModelProtocol,
        updateAction: @escaping (TaskModelProtocol) -> Void,
        createAction: @escaping (TaskModelProtocol) -> Void
    ) {
        self.task = task
        self.updateAction = updateAction
        self.createAction = createAction
    }
    
    func save() {
        updateAction?(task)
    }
    
    func create() {
        createAction?(task)
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
}
