//
//  ContentView.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    @Namespace var animation
    
    @State var isShowStartTrip: Bool = false
    
    let effectId = "smooth-transition"
    
    var body: some View {
        ZStack {
            if isShowStartTrip {
                StartNavigationScreenView(effectId: effectId,
                              animation: animation,
                              isShowStartTrip: $isShowStartTrip)
            } else {
                HomeScreenView(
                    effectId: effectId,
                    animation: animation,
                    isShowStartTrip: $isShowStartTrip
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
