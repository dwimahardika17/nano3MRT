//
//  NavigationPoint.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 18/07/23.
//

import Foundation

/**
 Represents a navigation point, which is a location in a sequence of navigation steps. Located in a train station.

 The `NavigationPoint` struct encapsulates the attributes and properties associated with a specific location that serves as a point in a sequence of navigation steps. It represents a location within a train station that helps guide navigation.

 Usage:
    let navigationPoint = NavigationPoint(name: "Platform 3", accessibility: .accessible, nearbyPlaces: [place1, place2], icon: .arrow)

 - Note: This struct provides information about a location within a train station used for navigation purposes.

 - Important: Each instance of `NavigationPoint` should have a valid name and accessibility category.

 - SeeAlso: `Point`, `AccessibilityCategory`, `Coordinate`, `Place`, `AmenityCategory`, `DirectionIcon`
 */
struct NavigationPoint: Point {
    /// The name of the navigation point.
    var name: String
    
    /// The description of the navigation point.
    var description: String?
    
    /// The accessibility category of the navigation point.
    var accessibility: AccessibilityCategory
    
    /// The coordinates of the navigation point.
    var coordinate: Coordinate?
    
    /// The nearby places around the navigation point.
    var nearbyPlaces: [Place]
    
    /// The amenity category of the navigation point.
    var amenity: AmenityCategory?
    
    /// The URLs of the navigation point's images.
    var imageUrls: [URL]
    
    /// The icon representing the navigation point's direction.
    var icon: DirectionIcon
}
