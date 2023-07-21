//
//  InputTripView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI
import MapKit

struct InputTripView: View {
    
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
    
    @ObservedObject var viewModel = TripViewModel()
    
    var body: some View {
        VStack {
            NavigationBarView(isShowStartTrip: $isShowStartTrip)
            
            HStack {
                VStack {
                    PulsableIconView(imageSystemName: "flag.circle.fill", color: Color("Primary"), isEditing: $isEditDeparture, animate: $editDepartureAnimate)
                    
                    NavigationVerticalDivider()
                    
                    PulsableIconView(imageSystemName: "mappin.circle.fill", color: Color("Secondary"), isEditing: $isEditDestination, animate: $editDestinationAnimate)
                        .matchedGeometryEffect(id: effectId + "icon", in: animation)
                }
                
                VStack(spacing: 0) {
                    InlineTextFieldView(text: $viewModel.departureQuery, placeholder: "Search for a location...", isFirstResponder: false) { isEditing in
                        isEditDeparture = isEditing
                    }
                    
                    Divider()
                    
                    InlineTextFieldView(text: $viewModel.destinationQuery, placeholder: "Search for a destination...", isFirstResponder: true) { isEditing in
                        isEditDestination = isEditing
                    }
                }
            }
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 30)
            .matchedGeometryEffect(id: effectId + "textfield", in: animation)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Group {
                        switch viewModel.status {
                        case .noResults: Text("No Results")
                        case .error(let description): Text("Error: \(description)")
                        default: EmptyView()
                        }
                    }
                    
                    ForEach(viewModel.destinationSearchResults, id: \.self) { mapItem in
                        HStack(spacing: 16) {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.system(size: 22))
                            
                            VStack(alignment: .leading) {
                                Text(mapItem.name ?? "")
                                    .font(.system(size: 16, weight: .medium))
                                
                                if !Helpers.address(mapItem.placemark).isEmpty  {
                                    Text(Helpers.address(mapItem.placemark))
                                        .font(.system(size: 12, weight: .regular))
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        }
                        .padding(.vertical, 16)
                        .padding(.horizontal, 8)
                        .multilineTextAlignment(.leading)
                    }
                    
                }
            }
            .padding(.top, 24)
            .scrollIndicators(.hidden)
            .frame(maxHeight: .infinity)
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
        .onChange(of: viewModel.departureQuery) { newValue in
            viewModel.search(for: .departure)
        }
        .onChange(of: viewModel.destinationQuery) { newValue in
            viewModel.search(for: .destination)
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
