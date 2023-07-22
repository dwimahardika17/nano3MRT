//
//  CircleFill.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 21/07/23.
//

import SwiftUI

struct CircleFill: View {
    var body: some View {
        Image("arrowDown")
            .resizable()
            .frame(width: 10,height: 10)
            .padding(.leading,18)
    }
}

struct CircleFill_Previews: PreviewProvider {
    static var previews: some View {
        CircleFill()
    }
}
