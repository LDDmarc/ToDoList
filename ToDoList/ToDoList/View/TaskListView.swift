//
//  TaskListView.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct TaskListView<ViewModel: TaskListViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State private var isAddingViewShowing = false
    
    var body: some View {
        List {
            ForEach($viewModel.tasksViewModel, id: \.id) { task in
                NavigationLink {
                    DetailTaskView(viewModel: task.wrappedValue, state: .none, isPresented: .constant(false))
                } label: {
                    TaskCell(task: task)                }
            }
            .onDelete { offsets in
                viewModel.deleteTasks(offsets: offsets)
            }
        }
        .toolbar {
            Button {
                isAddingViewShowing = true
            } label: {
                Image(systemName: "plus")
            }

        }
        .navigationTitle("ToDo List")
        .sheet(isPresented: $isAddingViewShowing, content: {
            NavigationView {
                DetailTaskView(viewModel: viewModel.newTaskViewModel, state: .addNew, isPresented: $isAddingViewShowing)
            }
        })
    }
}

struct TaskPriorityView: View {
    let taskPriority: Priority
    
    var body: some View {
        Text(taskPriority.emoji)
    }
}

//struct TaskListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskListView()
//    }
//}
