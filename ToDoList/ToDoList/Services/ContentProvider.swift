//
//  ContentProvider.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation
import Combine

protocol ContentProvider {
    var tasks: [TaskModelProtocol] { get }
    var tasksPublisher: Published<[TaskModelProtocol]>.Publisher { get }
    
    func getTask(for id: String) -> TaskModelProtocol?
    
    func addTask(
        newModel: TaskModelProtocol
    )
    
    func updateTask(
        newModel: TaskModelProtocol
    )
    
    func deleteTasks(offsets: IndexSet)
}
