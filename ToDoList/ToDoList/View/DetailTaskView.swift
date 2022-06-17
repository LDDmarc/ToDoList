//
//  DetailTaskView.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct DetailTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    
    @State private var isEditing = true
    @FocusState private var isFocused: Bool
    private var priorities = TaskModel.Priority.allCases
    
    init(viewModel: TaskViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack {
                InputTextField(
                    text: $viewModel.name,
                    title: "Title",
                    placeholder: "Dishes",
                    focused: _isFocused
                ).padding()
                
                InputTextField(
                    text: $viewModel.description,
                    title: "Description",
                    placeholder: "",
                    focused: _isFocused
                ).padding()
                
                priorityPicker.padding()
                
                HStack {
                    Text("Status")
                    Spacer()
                    CheckMark(isOn: $viewModel.isDone)
                }
                .padding().roundedBorder().padding()
                
                Spacer()
                
                if isEditing {
                    buttons.padding()
                }
                
                Spacer()
            }
            .disabled(!isEditing)
            .navigationTitle("Task")
            .toolbar {
                editButton
            }
        }
    }
    
    private var priorityPicker: some View {
        VStack(alignment: .leading) {
            Text("Priority")
                .font(.callout)
            
            Picker("Priority", selection: $viewModel.priority) {
                ForEach(priorities, id: \.rawValue) { priority in
                    Text(priority.emoji)
                        .tag(priority)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
    
    private var buttons: some View {
        ButtonsView(
            title1: "Save",
            action1: {
                isFocused = false
                isEditing.toggle()
                
            },
            title2: "Cancel",
            action2: {
                viewModel.rollBack()
                isEditing.toggle()
            }
        )
    }
    
    private var editButton: some View {
        Button {
            isEditing.toggle()
            if isEditing { viewModel.makeReserveCopy() }
        } label: {
            if !isEditing { Text("Edit") }
        }
    }
}

private struct ButtonsView: View {
    var title1: String
    var action1: () -> Void
    var title2: String
    var action2: () -> Void
    
    var body: some View {
        HStack {
            Button {
                action1()
            } label: {
                Text("Save")
                    .bold()
                    .foregroundColor(Color(UIColor.systemGreen))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .roundedBorder()
            }
            
            Button {
                action2()
            } label: {
                Text("Cancel")
                    .foregroundColor(Color(UIColor.systemRed))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .roundedBorder()
            }
            
        }
    }
}

struct DetailTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let provider = MockContentProvider()
            let viewModel = TaskViewModel(contentProvider: provider, task: provider.tasks.first!)
            DetailTaskView(viewModel: viewModel)
        }
    }
}
