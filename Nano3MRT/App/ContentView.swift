//
//  ContentView.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchLocation = ""
    
    var body: some View {
        VStack {
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
            ZStack(alignment: .leading) {
                TextField("", text: $searchLocation)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(30)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            Spacer()
                        }
                    )
                
                if searchLocation.isEmpty {
                    Text("Where do you need directions to?")
                        .foregroundColor(.gray)
                        .padding(.leading, 40)
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
