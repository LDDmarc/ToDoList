//
//  SegmentedPicker.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

protocol DescriptionProviding {
    var description: String { get }
}

struct SegmentedPicker<SelectionValue>: View where SelectionValue: Hashable & Identifiable & DescriptionProviding {
    let title: String
    let selection: Binding<SelectionValue>
    let selectionList: [SelectionValue]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.callout)
            
            Picker(title, selection: selection) {
                ForEach(selectionList) { value in
                    Text(value.description).tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}
//
//struct SegmentedPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        SegmentedPicker()
//    }
//}
