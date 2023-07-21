//
//  StartTripScreenView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct StartTripScreenView: View {
    
    @Namespace var animation
    
    @State var isShowStartTrip: Bool = false
    
    let effectId = "smooth-transition"
    
    var body: some View {
        ZStack {
            if isShowStartTrip {
                DestinationPlan(effectId: effectId,
                              animation: animation,
                              isShowStartTrip: $isShowStartTrip)
            } else {
                ContentView(
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
        StartTripScreenView()
    }
}
