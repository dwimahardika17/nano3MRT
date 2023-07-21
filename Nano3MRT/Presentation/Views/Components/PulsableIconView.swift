//
//  PulsableIconView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct PulsableIconView: View {
    
    let imageSystemName: String
    let color: Color
    
    @Binding var isEditing: Bool
    @Binding var animate: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: imageSystemName)
                .font(.system(size: 22, weight: .medium))
                .foregroundStyle(.white, isEditing ? color : Color.gray)
                .zIndex(10)
                .animation(.easeIn, value: isEditing)
            
            Group {
                Circle().fill(color.opacity(0.25)).frame(height: 40).scaleEffect(animate ? 1 : 0)
                Circle().fill(color.opacity(0.35)).frame(height: 30).scaleEffect(animate ? 1 : 0)
                Circle().fill(color.opacity(0.45)).frame(height: 15).scaleEffect(animate ? 1 : 0)
                Circle().fill(color).frame(height: 6.25)
            }
            .opacity(isEditing ? 1 : 0)
            
        }
        .frame(width: 35, height: 25)
        .animation(animate ? Animation.easeInOut(duration: 1).repeatForever(autoreverses: true) : .default, value: animate)
        .onAppear {
            self.animate = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                self.animate = true
            }
        }
    }
}
