//
//  StartNavigationScreenView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI
import MapKit

struct StartNavigationScreenView: View {
    
    let effectId: String
    let animation: Namespace.ID
    
    @Binding var isShowStartTrip: Bool
    @State var departureQuery: String = ""
    @State var destinationQuery: String = ""
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    
    var body: some View {
        VStack {
            NavigationBarView(isShowStartTrip: $isShowStartTrip)
            
            SearchBarView(departureQuery: $departureQuery, destinationQuery: $destinationQuery, effectId: effectId, animation: animation)
            
            VStack {
                if navigationViewModel.status == .noResult(.departure) ||
                    navigationViewModel.status == .noResult(.destination) {
                    HStack {
                        Image(systemName: "mappin.slash")
                            .foregroundColor(Color.red)
                            .font(.system(size: 22))
                        
                        Text("Location not found")
                            .fontWeight(.medium)
                    }
                }
                
                if navigationViewModel.status == .results(.departure) {
                    ResultScrollView(results: navigationViewModel.departureResults, onSelect:{ result in
                        hideKeyboard()
                        navigationViewModel.onSelectDepartureResult(result)
                    })
                }
                
                if navigationViewModel.status == .results(.destination) {
                    ResultScrollView(results: navigationViewModel.destinationResults, onSelect: { result in
                        hideKeyboard()
                        navigationViewModel.onSelectDestinationResult(result)
                    })
                }
            }
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
        .onAppear {
            departureQuery = navigationViewModel.departurePlacemark?.name ?? ""
            destinationQuery = navigationViewModel.destinationPlacemark?.name ?? ""
            navigationViewModel.onAppear()
        }
        .onDisappear {
            navigationViewModel.updateUserLocation()
        }
        .onChange(of: departureQuery) { newValue in
            navigationViewModel.searchDeparture(query: newValue)
        }
        .onChange(of: destinationQuery) { newValue in
            navigationViewModel.searchDestination(query: newValue)
        }
        .onChange(of: navigationViewModel.departurePlacemark) { newValue in
            departureQuery = newValue?.name ?? ""
        }
        .onChange(of: navigationViewModel.destinationPlacemark) { newValue in
            destinationQuery = newValue?.name ?? ""
        }
    }
}

struct StartNavigationScreenView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        StartNavigationScreenView(effectId: "", animation: namespace, isShowStartTrip: .constant(true))
            .environmentObject(NavigationViewModel())
    }
}
