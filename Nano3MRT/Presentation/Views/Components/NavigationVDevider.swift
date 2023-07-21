//
//  NavigationVDevider.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 20/07/23.
//

import SwiftUI

struct NavigationVDevider: View {
    var body: some View {
        VStack(spacing: 2) {
            Circle()
                .frame(width: 2)
            Circle()
                .frame(width: 2)
            Circle()
                .frame(width: 2)
        }
        .foregroundColor(.gray)
    }
}
