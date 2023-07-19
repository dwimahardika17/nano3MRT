//
//  Point.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents a point with location information.

 The `Point` protocol defines the properties associated with a point that has location information. It provides common attributes such as name, accessibility category, coordinates, nearby places, amenity category, and image URLs.

 Usage:
    struct MyPoint: Point {
        // Implement the required properties
    }

 - Note: This protocol serves as a blueprint for defining points with location information.

 - Important: Types conforming to `Point` should provide implementations for the required properties.

 - SeeAlso: `DistanceMeasurable`, `Coordinate`, `AccessibilityCategory`, `Place`, `AmenityCategory`
 */
protocol Point: DistanceMeasurable {
    /// The name of the point.
    var name: String { get }
    
    /// The accessibility category of the point.
    var accessibility: AccessibilityCategory { get }
    
    /// The coordinates of the point.
    var coordinate: Coordinate? { get }
    
    /// The nearby places around the point.
    var nearbyPlaces: [Place] { get }
    
    /// The amenity category of the point.
    var amenity: AmenityCategory? { get }
    
    /// The URLs of the point's images.
    var imageUrls: [URL] { get }
}
