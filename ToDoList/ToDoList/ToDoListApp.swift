//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

let dataManager: DataManager = UserDefaultsDataManager()
let contentProvider: ContentProvider = ToDoListContentProvider(dataManager: dataManager)
//let contentProvider: ContentProvider = MockContentProvider()

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(contentProvider: contentProvider)
        }
    }
}
