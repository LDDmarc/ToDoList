//
//  ContentView.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct ContentView: View {
    let contentProvider: ContentProvider
    
    var body: some View {
        NavigationView {
            TaskListView(viewModel: TaskListViewModel(contentProvider: contentProvider))
        }
    }
}
