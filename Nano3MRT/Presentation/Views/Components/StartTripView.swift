//
//  StartTripView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct StartTripView: View {
    
    let effectId: String
    
    let animation: Namespace.ID
    
    @Binding var isShowStartTrip: Bool
    
    @State var departureQuery: String = ""
    
    @State var destinationQuery: String = ""
    
    // MARK: Editing
    
    @State var isEditDeparture: Bool = false {
        didSet {
            editDepartureAnimate = isEditDeparture
        }
    }
    
    @State var editDepartureAnimate: Bool = true
    
    @State var isEditDestination: Bool = false {
        didSet {
            editDestinationAnimate = isEditDestination
        }
    }
    
    @State var editDestinationAnimate: Bool = true
    
    var body: some View {
        VStack {
            NavigationBarView(isShowStartTrip: $isShowStartTrip)
            
            HStack {
                VStack {
                    PulsableIconView(imageSystemName: "flag.circle.fill", color: Color("Primary"), isEditing: $isEditDeparture, animate: $editDepartureAnimate)
                    
                    NavigationVDevider()
                    
                    PulsableIconView(imageSystemName: "mappin.circle.fill", color: Color("Secondary"), isEditing: $isEditDestination, animate: $editDestinationAnimate)
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
            .shadow(radius: 30)
            .matchedGeometryEffect(id: effectId + "textfield", in: animation)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(alignment: .top) {
            Rectangle()
                .foregroundColor(Color("Primary"))
                .frame(height: 160)
                .edgesIgnoringSafeArea(.top)
                .matchedGeometryEffect(id: effectId + "background",
                                       in: animation,
                                       anchor: .top,
                                       isSource: false)
        }
    }
}

struct NavigationBarView: View {
    
    @Binding var isShowStartTrip: Bool
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 22, weight: .medium))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isShowStartTrip.toggle()
                        }
                    }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                Text("Start your trip")
                    .font(.system(size: 18, weight: .bold))
                Spacer()
            }
        }
        .foregroundColor(Color.white)
        .padding(.bottom, 24)
    }
}
