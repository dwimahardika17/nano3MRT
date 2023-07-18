//
//  Helpers.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

struct Helpers {
    static func distanceBetweenCoordinates(from coordinateA: Coordinate, to coordinateB: Coordinate) -> Double {
        let earthRadius = 6371000.0 // Earth's radius in meters
        
        let dLat = (coordinateB.latitude - coordinateA.latitude).toRadians()
        let dLon = (coordinateB.longitude - coordinateA.longitude).toRadians()
        
        let a = sin(dLat/2) * sin(dLat/2) + cos(coordinateA.latitude.toRadians()) * cos(coordinateB.latitude.toRadians()) * sin(dLon/2) * sin(dLon/2)
        let c = 2 * atan2(sqrt(a), sqrt(1-a))
        
        let distance = earthRadius * c
        return distance
    }
}
