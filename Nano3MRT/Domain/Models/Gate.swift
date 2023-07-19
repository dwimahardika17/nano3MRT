//
//  Gate.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents a gate within a train station.

 The `Gate` struct encapsulates the attributes and properties associated with a gate within a train station. It provides information about the gate's name, accessibility category, coordinates, nearby places, amenities, images, and gate type.

 Usage:
    let gateA = Gate(name: "Gate A", accessibility: .accessible, coordinate: Coordinate(latitude: 40.7128, longitude: -74.0060), nearbyPlaces: [place1, place2], imageUrls: [url1, url2], type: .entry)

 - Note: This struct serves as a representation of a gate within a station.

 - SeeAlso: `Point`, `AccessibilityCategory`, `Coordinate`, `Place`, `AmenityCategory`, `GateType`
 */
struct Gate: Point {
    
    /// The name of the gate.
    var name: String
    
    /// The accessibility category of the gate.
    var accessibility: AccessibilityCategory
    
    /// The coordinates of the gate.
    var coordinate: Coordinate?
    
    /// The nearby places around the gate.
    var nearbyPlaces: [Place]
    
    /// The amenity category of the gate. Default value is `.gate`.
    var amenity: AmenityCategory? = .gate
    
    /// The URLs of the gate's images.
    var imageUrls: [URL]
    
    /// The type of the gate.
    var type: GateType
}
