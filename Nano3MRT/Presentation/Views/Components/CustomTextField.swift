//
//  CustomTextField.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct CustomTextField: UIViewRepresentable {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        var isEditing: Bool = false {
            didSet {
                onEditing(isEditing)
            }
        }
        let onEditing: (_ isEditing: Bool) -> Void
        var didBecomeFirstResponder = false
        
        init(text: Binding<String>, onEditing: @escaping (_ isEditing: Bool) -> Void) {
            _text = text
            self.onEditing = onEditing
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            isEditing = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
            isEditing = false
        }
        
    }
    
    @Binding var text: String
    let placeholder: String
    let isFirstResponder: Bool
    let onEditing: (_ isEditing: Bool) -> Void
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.placeholder = placeholder
        textField.delegate = context.coordinator
        return textField
    }
    
    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, onEditing: onEditing)
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isFirstResponder && !context.coordinator.didBecomeFirstResponder  {
            uiView.becomeFirstResponder()
            context.coordinator.didBecomeFirstResponder = true
        }
    }
}
