//
//  TrainStop.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents a train stop or station along a train route.

 The `TrainStop` struct encapsulates the attributes and properties associated with a specific train stop or station. It represents a location where a train stops along a train route.

 Usage:
    let trainStop = TrainStop(name: "Central Station", accessibility: .accessible, coordinate: Coordinate(latitude: 40.7128, longitude: -74.0060), nearbyPlaces: [place1, place2], imageUrls: [url1, url2], trainRouteId: routeId)

 - Note: This struct provides information about train stops or stations along a train route.

 - Important: Each instance of `TrainStop` should have a valid name, accessibility category, and train route ID.

 - SeeAlso: `Point`, `AccessibilityCategory`, `Coordinate`, `Place`, `AmenityCategory`
 */
struct TrainStop: Point {
    /// The name of the train stop or station.
    var name: String
    
    /// The accessibility category of the train stop or station.
    var accessibility: AccessibilityCategory
    
    /// The coordinates of the train stop or station.
    var coordinate: Coordinate?
    
    /// The nearby places around the train stop or station.
    var nearbyPlaces: [Place]
    
    /// The amenity category of the train stop or station. Default value is `.trainStop`.
    var amenity: AmenityCategory? = .trainStop
    
    /// The URLs of the train stop or station's images.
    var imageUrls: [URL]
    
    /// The unique identifier of the train route associated with the train stop or station.
    var trainRouteId: UUID
}
