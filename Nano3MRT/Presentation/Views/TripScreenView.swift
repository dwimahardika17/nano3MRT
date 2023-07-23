//
//  TripScreenView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct TripScreenView: View {
    
    @Namespace var animation
    
    @State var isShowStartTrip: Bool = false
    
    let effectId = "smooth-transition"
    
    var body: some View {
        ZStack {
            if isShowStartTrip {
                InputTripView(effectId: effectId,
                              animation: animation,
                              isShowStartTrip: $isShowStartTrip)
            } else {
                HomeView(
                    effectId: effectId,
                    animation: animation,
                    isShowStartTrip: $isShowStartTrip
                )
            }
        }
    }
}

struct StartTripScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TripScreenView()
    }
}
