//
//  TaskListView.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: TaskListViewModel
    @State private var isAddingViewShowing = false
    
    var body: some View {
        List {
            ForEach($viewModel.tasksViewModel, id: \.id) { task in
                NavigationLink {
                    DetailTaskView(viewModel: task.wrappedValue, state: .none, isPresented: .constant(false))
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(task.name.wrappedValue).font(.title3).bold()
                            TaskPriorityView(taskPriority: task.priority.wrappedValue)
                            Spacer()
                            CheckMark(isOn: task.isDone)
                        }
                        .opacity(task.isDone.wrappedValue ? 0.7 : 1)

                        Text(task.description.wrappedValue)
                            .lineLimit(2)
                            .opacity(task.isDone.wrappedValue ? 0.7 : 1)
                    }
                }
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
    let taskPriority: TaskModel.Priority
    
    var body: some View {
        Text(taskPriority.emoji)
    }
}


//struct TaskListView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskListView()
//    }
//}
