//
//  Station.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents a train station where trains stop and passengers embark and disembark.

 The `Station` struct encapsulates the attributes and properties associated with a train station. It represents a location where trains make stops, and passengers can board and alight from the trains.

 Usage:
    let station = Station(name: "Central Station", address: "123 Main Street", coordinate: Coordinate(latitude: 40.7128, longitude: -74.0060), navigations: [navigation1, navigation2], entranceGates: [gate1, gate2], exitGates: [gate3, gate4], trainStops: [trainStop1, trainStop2])

 - Note: This struct provides information about a train station, including its name, address, coordinates, navigations, entrance gates, exit gates, train stops, and nearby places.

 - Important: Each instance of `Station` should have a valid name and may include other relevant properties as needed.

 - SeeAlso: `Coordinate`, `Navigation`, `Gate`, `TrainStop`, `Place`
 */
struct Station {
    /// The name of the train station.
    var name: String
    
    /// The address of the train station.
    var address: String
    
    /// The geographical coordinate of the train station.
    var coordinate: Coordinate?
    
    /// The navigations representing routes and steps within the train station.
    var navigations: [Navigation]
    
    /// The entrance gates of the train station.
    var entranceGates: [Gate]
    
    /// The exit gates of the train station.
    var exitGates: [Gate]
    
    /// The train stops within the train station.
    var trainStops: [TrainStop]
    
    /// The nearby places around the train station.
    var nearbyPlaces: [Place] {
        var places = [Place]()
        entranceGates.forEach { gate in
            gate.nearbyPlaces.forEach { places.append($0) }
        }
        exitGates.forEach { gate in
            gate.nearbyPlaces.forEach { places.append($0) }
        }
        return places.uniqued()
    }
}

extension Station: DistanceMeasurable {}
