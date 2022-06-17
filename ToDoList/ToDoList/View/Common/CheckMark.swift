//
//  CheckMark.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct CheckMark: View {
    @Binding var isOn: Bool

    var body: some View {
        Image(systemName: isOn ? "checkmark.circle" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.green)
            .onTapGesture {
                isOn.toggle()
            }
    }
}

struct CheckMark_Previews: PreviewProvider {
    static var previews: some View {
        CheckMark(isOn: .constant(true))
    }
}
