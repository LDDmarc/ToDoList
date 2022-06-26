//
//  ContentView.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct ContentView<ViewModel: TaskListViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            TaskListView(viewModel: viewModel)
        }
    }
}
