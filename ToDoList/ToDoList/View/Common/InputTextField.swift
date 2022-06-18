//
//  InputTextField.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import SwiftUI

struct InputTextField: View {
    @Binding var text: String
    var title: String
    var placeholder: String
    @FocusState var focused: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
            TextField(placeholder, text: $text)
                .focused($focused)
        }
        .padding(10)
        .roundedBorder()
    }
}

struct InputTextField_Previews: PreviewProvider {
    static var previews: some View {
        InputTextField(text: .constant("SFJapca"), title: "fskvns", placeholder: "gdnlfks")
    }
}
