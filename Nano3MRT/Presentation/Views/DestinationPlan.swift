//
//  DestinationPlan.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 19/07/23.
//

import SwiftUI

struct DestinationPlan: View {
    @State private var currentLocation = ""
    @State private var destinationLocation = ""
    
    
    let recommendation = [
        RoutesRecommendation(id: 1,departureStation: "Blok M BCA", arrivalStation: "Bundaran HI", departureGate: "Gate A", arrivalGate: "Gate B", preferences: "No Preferences"),
        RoutesRecommendation(id: 2,departureStation: "Bundaran HI", arrivalStation: "Blok M BCA", departureGate: "Gate A", arrivalGate: "Gate B", preferences: "Wheelchair"),
        RoutesRecommendation(id:3,departureStation: "Blok M BCA", arrivalStation: "Bundaran HI", departureGate: "Gate A", arrivalGate: "Gate B", preferences: "Bicycle")
    ]
    
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
        VStack(alignment: .leading){
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
            HStack{
                Spacer()
                HStack {
                    HStack {
                        Image(systemName: "slider.horizontal.3")
                        Text("Preferences")
                    }
                    .padding(.all,10)
                }
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 1)
            }
            .padding(.trailing)
            VStack(alignment: .leading){
                Text("No Preference")
                    .foregroundColor(Color("DestinationCard"))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                NavigationLink{
                    Route()
                } label: {
                    VStack {
                        ForEach(recommendation, id: \.id) { recommendation in
                            if recommendation.preferences == "No Preferences" {
                                PlanCard(recommendation: recommendation)
                                
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                Divider()
                    .padding()
                Text("WheelChair")
                    .foregroundColor(Color("DestinationCard"))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                NavigationLink{
                    Route()
                } label: {
                    VStack {
                        ForEach(recommendation, id:\.id) { recommendation in
                            if recommendation.preferences == "Wheelchair"{
                                PlanCard(recommendation: recommendation)
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                Divider()
                    .padding()
                Text("Bicycle")
                    .foregroundColor(Color("DestinationCard"))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                NavigationLink{
                    Route()
                } label: {
                    VStack {
                        ForEach(recommendation, id:\.id) { recommendation in
                            if recommendation.preferences == "Bicycle"{
                                PlanCard(recommendation: recommendation)
                            }
                        }
                    }
                }
                .foregroundColor(.black)
            }
            
            Spacer()
        }
        .background(
            Image("Background2")
                .resizable()
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .navigationBarItems(leading: MyBackButton())
    }
}

struct MyBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left") // Set the custom back icon here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(.leading)
                Spacer()
                Text("MRT Navigation")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.all)
            .padding(.bottom)
            .frame(width: 400)
        }
    }
}

struct RoutesRecommendation{
    var id: Int
    var departureStation: String
    var arrivalStation: String
    var departureGate: String
    var arrivalGate: String
    var preferences: String
}

//struct DestinationPlan_Previews: PreviewProvider {
//    static var previews: some View {
//        DestinationPlan()
//    }
//}

