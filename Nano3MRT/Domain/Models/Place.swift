//
//  Place.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents a point of interest, landmark, or popular destination located outside or inside the train station.

 The `Place` struct encapsulates the attributes and properties associated with a specific location that serves as a point of interest, landmark, or popular destination near and in a train station.

 Usage:
    let centralPark = Place(name: "Central Park", coordinate: Coordinate(latitude: 40.7829, longitude: -73.9654))

 - Note: This struct provides a convenient way to store and manage information about places of interest.

 - Important: Each instance of `Place` should have a unique name and valid coordinate values.

 - SeeAlso: `Coordinate`
 */
struct Place: Identifiable {
    /// The unique identifier of the place.
    var id = UUID()

    /// The name of the place.
    var name: String

    /// The description of the place.
    var description: String?

    /// The geographical coordinate of the place.
    var coordinate: Coordinate
}

extension Place: Hashable {
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.name == rhs.name && lhs.coordinate == rhs.coordinate
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
