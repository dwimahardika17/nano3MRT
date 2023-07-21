//
//  DestinationPlan.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 19/07/23.
//

import SwiftUI

struct DestinationPlan: View {
    @State private var currentLocation = ""
    @State private var destinationLocation = ""
    var body: some View {
        VStack{
            HStack{
                Text("MRT J")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                VStack {
                    Text("1000 PTS")
                        .padding(4)
                }
                .background(Color.gray.opacity(0.5))
                .cornerRadius(8)
                Image(systemName: "bell")
                Image(systemName: "questionmark.circle")
            }
            .padding(.all)
            HStack{
                VStack{
                    Image(systemName: "target")
                        .padding(.bottom)
                    Image(systemName: "mappin")
                }
                .padding(.vertical)
                .padding(.leading)
                VStack(alignment: .leading){
                    Text("Current Location")
                    Divider()
                    TextField("Destination Location", text: $destinationLocation)
//                    Text("Destination Location")
                }
                .padding(.trailing)
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
            Spacer()
        }
    }
}

struct DestinationPlan_Previews: PreviewProvider {
    static var previews: some View {
        DestinationPlan()
    }
}
