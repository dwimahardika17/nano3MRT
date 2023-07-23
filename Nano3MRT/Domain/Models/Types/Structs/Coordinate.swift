//
//  Coordinate.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents geographical coordinates with longitude and latitude.
 
 The `Coordinate` struct encapsulates the attributes and properties associated with geographical coordinates. It provides a convenient way to store and work with longitude and latitude values.
 
 Usage:
 let coordinate = Coordinate(longitude: -74.0060, latitude: 40.7128)
 
 - Note: This struct serves as a representation of geographical coordinates.
 
 - Important: Each instance of `Coordinate` should have valid longitude and latitude values.
 
 - SeeAlso: `CLLocationCoordinate2D`
 */
struct Coordinate {
    /// The latitude value of the coordinate.
    var latitude: Double
    
    /// The longitude value of the coordinate.
    var longitude: Double
    
}

extension Coordinate: Equatable {}
