//
//  SearchBarView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var departureQuery: String
    @Binding var destinationQuery: String
    
    let effectId: String
    let animation: Namespace.ID
    
    @State private var isEditDeparture: Bool = false
    @State var isEditDestination: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                PulsableIconView(imageSystemName: "flag.circle.fill", color: Color("Primary"), isEditing: $isEditDeparture)
                
                NavigationVerticalDivider()
                
                PulsableIconView(imageSystemName: "mappin.circle.fill", color: Color("Secondary"), isEditing: $isEditDestination)
                    .matchedGeometryEffect(id: effectId + "icon", in: animation)
            }
            
            VStack(spacing: 0) {
                InlineTextFieldView(text: $departureQuery, placeholder: "Search for a location...", isFirstResponder: false) { isEditing in
                    isEditDeparture = isEditing
                }
                
                Divider()
                
                InlineTextFieldView(text: $destinationQuery, placeholder: "Search for a destination...", isFirstResponder: true) { isEditing in
                    isEditDestination = isEditing
                }
            }
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.15), radius: 5)
        .matchedGeometryEffect(id: effectId + "textfield", in: animation)
    }
}
