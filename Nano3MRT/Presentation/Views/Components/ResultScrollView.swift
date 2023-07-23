//
//  ResultScrollView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import SwiftUI

struct ResultScrollView: View {
    
    @State var results: [Placemark]
    
    let onSelect: (Placemark) -> Void
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(results, id: \.self) { placemark in
                    NavigationResultCardView(placemark)
                        .onTapGesture {
                            onSelect(placemark)
                        }
                }
            }
        }
        .padding(.top, 24)
        .scrollIndicators(.hidden)
    }
}
