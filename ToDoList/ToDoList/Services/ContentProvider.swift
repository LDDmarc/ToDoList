//
//  ContentProvider.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

protocol ContentProvider {
    var tasks: [TaskModel] { get }
    var tasksPublisher: Published<[TaskModel]>.Publisher { get }
    
    func getTask(for id: String) -> TaskModel?
    
    func addTask(
        newModel: TaskModel
    )
    
    func updateTask(
        newModel: TaskModel
    )
    
    func deleteTasks(offsets: IndexSet)
}
