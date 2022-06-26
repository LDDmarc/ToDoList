//
//  DetailTaskView.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct DetailTaskView<ViewModel: TaskViewModelProtocol>: View {
    @ObservedObject var viewModel: ViewModel
    @State var state: EditingState
    @Binding var isPresented: Bool
    
    @FocusState private var isFocused: Bool
    private var priorities = Priority.allCases
    
    init(
        viewModel: ViewModel,
        state: EditingState,
        isPresented: Binding<Bool>
    ) {
        self.viewModel = viewModel
        self.state = state
        _isPresented = isPresented
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
                
                SegmentedPicker(
                    title: "Priority",
                    selection: $viewModel.priority,
                    selectionList: priorities
                ).padding()
                
                HStack {
                    Text("Status")
                    Spacer()
                    CheckMark(isOn: $viewModel.isDone)
                }
                .padding().roundedBorder().padding()
                
                Spacer()
                
                switch state {
                case .addNew:
                    saveButton.padding()
                case .edit:
                    buttonsView.padding()
                case .none:
                    EmptyView()
                }
                
                Spacer()
            }
            .disabled(state == .none)
            .navigationTitle("Task")
            .toolbar {
                editToolBarButton
            }
        }
    }
    
    private var saveButton: some View {
        Button {
            viewModel.create()
            isPresented.toggle()
        } label: {
            Text("Save")
                .bold()
                .foregroundColor(Color(UIColor.systemGreen))
                .frame(maxWidth: .infinity)
                .padding()
                .roundedBorder()
        }
        .disabled(viewModel.name.isEmpty)
        .opacity(viewModel.name.isEmpty ? 0.3 : 1)
    }
    
    private var editToolBarButton: some View {
        return Button {
            switch state {
            case .addNew, .edit:
                break
            case .none:
                state = .edit
                viewModel.makeReserveCopy()
            }
        } label: {
            if state == .none { Text("Edit") }
        }
    }
    
    private var buttonsView: some View {
        HStack {
            Button {
                isFocused = false
                state = .none
                viewModel.save()
            } label: {
                Text("Save")
                    .bold()
                    .foregroundColor(Color(UIColor.systemGreen))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .roundedBorder()
                    .disabled(viewModel.name.isEmpty)
                    .opacity(viewModel.name.isEmpty ? 0.5 : 1)
            }
            
            Button {
                isFocused = false
                viewModel.rollBack()
                state = .none
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

extension DetailTaskView {
    enum EditingState {
        case addNew
        case edit
        case none
    }
}

//struct DetailTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            let provider = MockContentProvider()
//            let viewModel = TaskViewModel(contentProvider: provider, task: provider.tasks.first!)
//            DetailTaskView(viewModel: viewModel, state: .addNew, isPresented: .constant(false))
//        }
//    }
//}
