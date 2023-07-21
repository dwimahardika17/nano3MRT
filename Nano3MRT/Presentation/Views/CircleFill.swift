//
//  CircleFill.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 21/07/23.
//

import SwiftUI

struct CircleFill: View {
    var body: some View {
        Image(systemName: "circle.fill")
            .resizable()
            .frame(width: 10,height: 10)
            .opacity(0.2)
            .padding(.leading,18)
    }
}

struct CircleFill_Previews: PreviewProvider {
    static var previews: some View {
        CircleFill()
    }
}
