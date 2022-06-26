//
//  TaskCell.swift
//  ToDoList
//
//  Created by Дарья Леонова on 25.06.2022.
//

import SwiftUI

struct TaskCell<ViewModel: TaskViewModelProtocol>: View {
    @Binding var task: ViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(task.name).font(.title3).bold()
                TaskPriorityView(taskPriority: task.priority)
                Spacer()
                CheckMark(isOn: $task.isDone)
            }

            Text(task.description)
                .lineLimit(2)
        }
    }
}
