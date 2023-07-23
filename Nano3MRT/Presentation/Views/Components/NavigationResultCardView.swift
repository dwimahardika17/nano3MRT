//
//  NavigationResultCardView.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 22/07/23.
//

import SwiftUI

struct NavigationResultCardView: View {
    var placemark: Placemark
    
    init(_ placemark: Placemark) {
        self.placemark = placemark
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 22))
            
            VStack(alignment: .leading) {
                Text(placemark.name ?? "")
                    .font(.system(size: 16, weight: .medium))
                
                if let address = placemark.address {
                    Text(address)
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
