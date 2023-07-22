//
//  CustomCard.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 21/07/23.
//

import SwiftUI

struct CustomCard: ViewModifier {
    func body(content: Content) -> some View {
            content
                .padding(.trailing)
                .background(Color("CardBackground").opacity(0.3))
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding(.horizontal)
        }}

extension View {
    func customCardStyle() -> some View {
        self.modifier(CustomCard())
    }
}

