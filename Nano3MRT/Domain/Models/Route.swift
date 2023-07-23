//
//  Route.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents a train route with a sequence of stations.
 
 The `Route` struct encapsulates the attributes and properties associated with a train route. It represents a specific route followed by a train, consisting of a sequence of stations.
 
 Usage:
 let trainRoute = Route(id: routeId, name: "Express Route", stations: [station1, station2, station3])
 
 - Note: This struct provides information about a train route, including its identifier, name, and the sequence of stations.
 
 - Important: Each instance of `Route` should have a unique identifier and may include other relevant properties as needed.
 
 - SeeAlso: `Station`, `Placemark`
 */
struct Route: Identifiable {
    /// The unique identifier of the train route.
    var id: UUID
    
    /// The name of the train route.
    var name: String
    
    /// The sequence of stations in the train route.
    var stations: [Station]
    
    /// The first station in the train route.
    var firstStation: Station? {
        stations.first
    }
    
    /// The last station in the train route.
    var lastStation: Station? {
        stations.last
    }
    
    /**
     Retrieves the train stop associated with the specified station.
     
     - Parameter station: The station for which to retrieve the train stop.
     - Returns: The train stop associated with the specified station, if found.
     */
    func trainStop(in station: Station) -> Placemark? {
        station.trainStops?.first { $0.route?.id == id }
    }
    
    func hasStationsInRoute(_ departureStation: Station, _ destinationStation: Station) -> Bool {
        if let departureIndex = stations.firstIndex(of: departureStation),
           let destinationIndex = stations.firstIndex(of: destinationStation) {
            return departureIndex < destinationIndex
        }
        return false
    }
}