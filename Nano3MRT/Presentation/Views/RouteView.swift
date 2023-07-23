//
//  RouteView.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 19/07/23.
//

import SwiftUI

struct RouteView: View {
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .center){
                    Text("departure station")
                    HStack{
                        DisclosureGroup{
                            Text("Bendungan Hilir")
                            Text("Bendungan Hilir")
                            Text("Bendungan Hilir")
                        } label: {
                            Text("Bendungan Hilir")
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 150)
                    .foregroundColor(Color.black)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                }
                Spacer()
                VStack(alignment: .center){
                    Text("departure station")
                    HStack{
                        DisclosureGroup{
                            Text("Bundaran HI")
                            Text("Bendungan HI")
                            Text("Bendungan HI")
                        } label: {
                            Text("Bundaran HI")
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 150)
                    .foregroundColor(Color.black)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(10)
                }
            }
            .padding(.all)
            VStack(alignment: .leading) {
                HStack(alignment: .bottom){
                    HStack(alignment: .bottom){
                        Image(systemName: "target")
                            .resizable()
                            .frame(width: 15,height: 15)
                    }
                    VStack(alignment: .leading){
                        Text("Start From")
                            .font(.caption)
                        Text("Current Location")
                    }
                }
                .padding(.horizontal)
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .opacity(0.3)
                    .padding(.leading,18)
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Image(systemName: "target")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.top)
                    VStack(alignment: .leading){
                        Text("Stasiun Bendungan Hilir")
                            .fontWeight(.bold)
                        HStack{
                            Image(systemName: "arrow.up")
                            Text("Entrance Gate A | near Sampoerna Office")
                                .font(.caption)
                        }
                        .padding(.trailing)
                    }
                    .padding(.trailing)
                    .padding(.vertical)
                }
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .opacity(0.3)
                    .padding(.leading,18)
                HStack{
                    Image(systemName: "target")
                        .resizable()
                        .frame(width: 15,height: 15)
                    Text("2 Station stops")
                }
                .padding(.horizontal)
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .opacity(0.3)
                    .padding(.leading,18)
                DisclosureGroup{
                    HStack{
                        Image(systemName: "arrow.uturn.right")
                        Text("Turn right to ticketing gate")
                        Spacer()
                        Rectangle()
                            .frame(width: 100, height: 70)
                    }
                    .padding(.all)
                        .font(.caption)
                } label: {
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "target")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        VStack(alignment: .leading){
                            Text("Stasiun Bendungan Hilir")
                                .fontWeight(.bold)
                            HStack{
                                Image(systemName: "arrow.up")
                                Text("Entrance Gate A | near Sampoerna Office")
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
                    
                }
                .background(Color.gray.opacity(0.5))
                .foregroundColor(.black)
                .cornerRadius(10)
                .padding(.horizontal)
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10,height: 10)
                    .opacity(0.3)
                    .padding(.leading,18)
                HStack{
                    Image(systemName: "mappin")
                        .resizable()
                        .frame(width: 10,height: 20)
                    Text("Destination Location")
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        
    }
}

struct Route_Previews: PreviewProvider {
    static var previews: some View {
        RouteView()
    }
}
