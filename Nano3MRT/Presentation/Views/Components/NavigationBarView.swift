//
//  NavigationBarView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import SwiftUI

struct NavigationBarView: View {
    
    @Binding var isShowStartTrip: Bool
    
    var body: some View {
        ZStack {
            HStack {
                Image(systemName: "arrow.left")
                    .font(.system(size: 22, weight: .medium))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            hideKeyboard()
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
