//
//  InlineTextFieldView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct InlineTextFieldView: View {
    
    @Binding var text: String
    @FocusState private var isFocused: Bool
    let placeholder: String
    let isFirstResponder: Bool
    let onEditing: (_ isEditing: Bool) -> Void
    let onSubmit: () -> Void = {}
    
    func ownOnSubmit() {
        onSubmit()
        isFocused.toggle()
    }
    
    var body: some View {
        CustomTextField(text: $text, placeholder: placeholder, isFirstResponder: isFirstResponder, onEditing: onEditing, onSubmit: ownOnSubmit)
            .focused($isFocused)
            .font(.system(size: 16))
            .frame(height: 22)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
    }
}
