//
//  Station.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

struct Station {
    let name: String
    let address: String
    let coordinate: Coordinate
    let navigations: [Navigation]
    let entranceGates: [Point]
    let exitGates: [Point]
    
    var nearbyPlaces: [Place] {
        var places = [Place]()
        entranceGates.forEach{$0.nearbyPlaces.forEach{places.append($0)}}
        exitGates.forEach{$0.nearbyPlaces.forEach{places.append($0)}}
        return places.uniqued()
    }
    
    func getDistanceFrom(_ coordinate: Coordinate) -> Double {
        return Helpers.distanceBetweenCoordinates(from: self.coordinate, to: coordinate)
    }
}
