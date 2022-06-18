//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

private let dataManager: DataManager = UserDefaultsDataManager()
private let contentProvider: ContentProvider = ToDoListContentProvider(dataManager: dataManager)
//let contentProvider: ContentProvider = MockContentProvider()

@main
struct ToDoListApp: App {
    @StateObject var viewModel = TaskListViewModel(contentProvider: contentProvider)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
