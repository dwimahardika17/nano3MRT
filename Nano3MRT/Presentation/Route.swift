//
//  Route.swift
//  Nano3MRT
//
//  Created by I MADE DWI MAHARDIKA on 19/07/23.
//

import SwiftUI

struct Route: View {
    
    @State private var isDepartureExpanded = false
    @State private var isArrivalExpanded = false
    @State private var isExpanded = false
    let stations = [
        StationsName(name: "Bendungan Hilir"),
        StationsName(name: "Station 2"),
        StationsName(name: "Station 3")
    ]
    
    let routes = [
        RoutesDummy(id: 1,routes: "Entrances Gate A", routesIcon: "arrow.up", routesImage: "image1"),
        RoutesDummy(id: 2,routes: "Turn left to Family Mart", routesHint: "Near Family Mart" ,routesIcon: "arrow.up", routesImage: "image2")
    ]
    
    let departureStation = DepartureStatition(stationName: "Stasiun Bendungan Hilir", gate: "Gate A", hint: "Near Sampoerna Office")
    
    let arrivalStation = ArrivalStation(stationName: "Stasiun Dukuh Atas", gate: "Gate B", hint: "Near Family Mart")
    
    @State private var selectedDepartureStation: StationsName?
    @State private var selectedArrivalStation: StationsName?
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                VStack(alignment: .leading) {
                    Text("Departure station")
                        .fontWeight(.thin)
                    DisclosureGroup(isExpanded: $isDepartureExpanded) {
                        VStack(alignment: .leading) {
                            ForEach(stations, id: \.name) { station in
                                Text(station.name)
                                    .onTapGesture {
                                        selectedDepartureStation = station
                                        withAnimation {
                                            isDepartureExpanded.toggle()
                                        }
                                    }
                            }
                        }
                    } label: {
                        Text(selectedDepartureStation?.name ?? "Select Station")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                    }
                    .padding(.trailing)
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                    .background(Color("Primary"))
                    .cornerRadius(10)
                    
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Arrival station")
                        .fontWeight(.thin)
                    DisclosureGroup(isExpanded: $isArrivalExpanded) {
                        VStack(alignment: .leading) {
                            ForEach(stations, id: \.name) { station in
                                Text(station.name)
                                    .onTapGesture {
                                        selectedArrivalStation = station
                                        withAnimation {
                                            isArrivalExpanded.toggle()
                                        }
                                    }
                            }
                        }
                    } label: {
                        Text(selectedArrivalStation?.name ?? "Select Station")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                    }
                    .padding(.trailing)
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                    .background(Color("Primary"))
                    .cornerRadius(10)
                    
                }
            }
            .padding(.all)
            VStack(alignment: .leading) {
                HStack(alignment: .bottom){
                    HStack(alignment: .bottom){
                        Image(systemName: "location.north.circle.fill")
                            .resizable()
                            .frame(width: 15,height: 15)
                    }
                    VStack(alignment: .leading){
                        Text("Start From")
                            .font(.caption)
                        Text("Current Location")
                    }
                }
                .foregroundColor(Color("DestinationCard"))
                .padding(.horizontal)
                CircleFill()
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Image(systemName: "tram.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Secondary"))
                    }
                    .padding(.top)
                    .padding(.leading)
                    VStack(alignment: .leading){
                        Text(departureStation.stationName)
                            .fontWeight(.bold)
                        HStack(alignment: .center){
                            Image(systemName: "arrow.up")
                            VStack(alignment: .leading) {
                                Text(departureStation.gate)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text(departureStation.hint)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.trailing)
                    .padding(.vertical)
                    Spacer()
                }
                .customCardStyle()
                
                CircleFill()
                HStack{
                    Image(systemName: "tram.circle.fill")
                        .resizable()
                        .frame(width: 15,height: 15)
                    Text("2 Station stops")
                        .font(.caption)
                }
                .foregroundColor(Color("DestinationCard"))
                .padding(.horizontal)
                CircleFill()
                DisclosureGroup{
                    
                    ForEach(routes, id:\.id) { route in
                        HStack{
                            HStack(alignment: .center){
                                Image(systemName: route.routesIcon)
                                VStack(alignment: .leading) {
                                    Text(route.routes)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Text(route.routesHint ?? "")
                                        .font(.caption)
                                }
                                .foregroundColor(Color("DestinationCard"))
                            }
                            Spacer()
                            Rectangle()
                                .frame(width: 100, height: 70)
                        }
                        .padding(.horizontal)
                        .font(.caption)
                    }
                    
                    
                } label: {
                    HStack(alignment: .top){
                        VStack(alignment: .leading){
                            Image(systemName: "tram.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("Secondary"))
                        }
                        VStack(alignment: .leading){
                            Text(arrivalStation.stationName)
                                .fontWeight(.bold)
                            HStack(alignment: .center){
                                Image(systemName: "arrow.up")
                                VStack(alignment: .leading) {
                                    Text(arrivalStation.gate)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                    Text(arrivalStation.hint)
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.trailing)
                    }
                    .foregroundColor(Color("DestinationCard"))
                    
                    .padding(.vertical)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.trailing)
                .customCardStyle()
                CircleFill()
                HStack(alignment: .bottom){
                    HStack(alignment: .bottom){
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .frame(width: 15,height: 15)
                    }
                    VStack(alignment: .leading){
                        Text("Finnish to")
                            .font(.caption)
                        Text("Destination Location")
                    }
                }
                .foregroundColor(Color("DestinationCard"))
                .padding(.horizontal)
            }
            Spacer()
        }
        
    }
}

struct StationsName{
    var name: String
}

struct RoutesDummy{
    var id: Int
    var routes: String
    var routesHint: String?
    var routesIcon: String
    var routesImage: String
}

struct DepartureStatition{
    var stationName: String
    var gate: String
    var hint: String
}

struct ArrivalStation{
    var stationName: String
    var gate: String
    var hint: String
}


struct Route_Previews: PreviewProvider {
    static var previews: some View {
        Route()
    }
}
