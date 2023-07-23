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
        RoutesDummy(id: 1,routes: "Entrances Gate A", routesIcon: "turnLeft", routesImage: "Rectangle"),
        RoutesDummy(id: 2,routes: "Turn left to Family Mart", routesHint: "Near Family Mart" ,routesIcon: "uturnRight", routesImage: "Rectangle")
    ]
    
    let departureStation = DepartureStatition(stationName: "Stasiun Bendungan Hilir", gate: "Gate A", hint: "Near Sampoerna Office", gateIcon: "gateF")
    
    let arrivalStation = ArrivalStation(stationName: "Stasiun Dukuh Atas", gate: "Gate B", hint: "Near Family Mart", image: "Rectangle", gateIcon: "gateD")
    
    @State private var selectedDepartureStation: StationsName?
    @State private var selectedArrivalStation: StationsName?
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                HStack(alignment: .bottom){
                    HStack(alignment: .bottom){
                        Image(systemName: "location.circle.fill")
                            .resizable()
                            .frame(width: 15,height: 15)
                            .foregroundColor(Color("Secondary"))
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
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "tram.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Primary"))
                        Text(departureStation.stationName)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.leading)
                    HStack{
                        Image(departureStation.gateIcon)
                            .resizable()
                            .frame(width: 30, height: 40)
                            .foregroundColor(Color.orange)
                        VStack(alignment: .leading) {
                            Text(departureStation.gate)
                                .font(.caption)
                                .fontWeight(.bold)
                            Text(departureStation.hint)
                                .font(.caption)
                        }
                    }
                    .padding(.leading)
                    .padding(.bottom)
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
                
                VStack(alignment: .leading){
                    HStack{
                        Image(systemName: "tram.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("Secondary"))
                        Text(departureStation.stationName)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.leading)
                    DisclosureGroup{
                        ForEach(routes, id:\.id) { route in
                            HStack{
                                HStack(alignment: .center){
                                    Image(route.routesIcon)
                                        .resizable()
                                        .frame(width: 20,height: 35)
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
                                Image(route.routesImage)
                                    .resizable()
                                    .frame(width: 100, height: 70)
                            }
                            .padding(.horizontal)
                            .font(.caption)
                        }
                    } label: {
                        HStack{
                            Image(arrivalStation.gateIcon)
                                .resizable()
                                .frame(width: 30, height: 40)
                            VStack(alignment: .leading) {
                                Text(arrivalStation.gate)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                Text(arrivalStation.hint)
                                    .font(.caption)
                            }
                            Spacer()
                            Image(arrivalStation.image)
                                .resizable()
                                .frame(width: 100, height: 70)
                        }
                        .padding(.leading)
                        .padding(.bottom)
                    }
                }
                .customCardStyle()
                CircleFill()
                HStack(alignment: .bottom){
                    HStack(alignment: .bottom){
                        Image(systemName: "mappin.circle.fill")
                            .resizable()
                            .frame(width: 15,height: 15)
                            .foregroundColor(Color.orange)
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
        .padding(.vertical)
        
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
    var gateIcon: String
}

struct ArrivalStation{
    var stationName: String
    var gate: String
    var hint: String
    var image: String
    var gateIcon:String
}


struct Route_Previews: PreviewProvider {
    static var previews: some View {
        Route()
    }
}
