//
//  AutoSlideScrollView.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 21/07/23.
//

import SwiftUI

struct AutoSlideScrollView: View {
    let images = ["Mask group", "Mask group-2", "Mask group-3", "Mask group-4", "Mask group-5"]
    @State private var currentIndex = 0

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(0..<images.count) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                }
                .offset(x: CGFloat(currentIndex) * -geometry.size.width, y: 0)
                .animation(.easeInOut(duration: 1.0))
                .onAppear {
                    startTimer()
                }
                .gesture(DragGesture()
                            .onChanged({ _ in
                                stopTimer()
                            })
                            .onEnded({ _ in
                                startTimer()
                            })
                )
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }

    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            withAnimation {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }

    private func stopTimer() {
        // Invalidate the timer when user interacts with the ScrollView
        Timer.scheduledTimer(withTimeInterval: .infinity, repeats: false) { _ in
            currentIndex = (currentIndex + 1) % images.count
        }
    }
}

struct AutoSlideScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AutoSlideScrollView()
    }
}
