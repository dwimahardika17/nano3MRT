//
//  ContentView.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 16/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchLocation = ""
    let effectId: String
    
    let animation: Namespace.ID
    
    @Binding var isShowStartTrip: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                VStack {
                    Spacer()
                    
                    Text("Ready to go with MRT, Sarah?")
                        .font(.system(size: 18))
                        .foregroundColor(Color.white)
                        .padding(.bottom, 24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "magnifyingglass")
                            .fontWeight(.medium)
                            .foregroundColor(Color.gray)
                            .frame(width: 35, height: 25)
                            .matchedGeometryEffect(id: effectId + "icon", in: animation)
                        
                        TextField("Where do you need directions to?", text: .constant(""))
                            .font(.system(size: 16))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    isShowStartTrip.toggle()
                                }
                            }
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(12)
                    .matchedGeometryEffect(id: effectId + "textfield", in: animation)
                }
                .frame(maxHeight: 200)
                .padding(.vertical, 24)
                .padding(.horizontal)
                .background(alignment: .top) {
                    Rectangle()
                        .foregroundColor(Color("Primary"))
                        .edgesIgnoringSafeArea(.top)
                        .matchedGeometryEffect(id: effectId + "background",
                                               in: animation,
                                               anchor: .top,
                                               isSource: true)
                }
                ScrollView {
                    HStack{
                        Image("menu button")
                        Image("menu button-2")
                        Image("menu button-3")
                        Image("menu button-4")
                        Image("menu button-5")
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    HStack{
                        Image("menu button-6")
                        Image("menu button-7")
                        Image("menu button-8")
                        Image("menu button-9")
                        Image("menu button-10")
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    AutoSlideScrollView()
                        .frame(height: 180)
                        .padding(.horizontal)
                        .padding(.vertical,-5)
                    Divider()
                        .padding(.horizontal)
                    VStack{
                        HStack{
                            Text("Lifestyle")
                            Spacer()
                            Text("see all")
                                .font(.caption)
                        }
                        .padding(.horizontal)
                        HStack{
                            Image("lifestyle button")
                            Image("lifestyle button-2")
                            Image("lifestyle button-3")
                            Image("lifestyle button-4")
                            Image("lifestyle button-5")
                        }
                    }
                    Divider()
                        .padding()
                    HStack{
                        Text("Promos")
                            .padding(.leading)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack{
                            Image("Mask group")
                            Image("Mask group-2")
                            Image("Mask group-3")
                            Image("Mask group-4")
                            Image("Mask group-5")
                        }
                        .padding(.leading)
                    }
                }
                .padding(.top)
                Spacer()
            }
            .background(Image("Background1")
                .resizable()
                .ignoresSafeArea()
            )
        }
        
    }
}
