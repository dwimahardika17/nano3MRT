//
//  DistanceMeasurable.swift
//  Nano3MRT
//
//  Created by Muhammad Rizki Ardyan on 19/07/23.
//

import Foundation

/**
 Represents a type that can be measured for distance to another coordinate.

 The `DistanceMeasurable` protocol defines the methods associated with measuring distance between locations. It provides a default implementation of `measureDistance(to:)` using the `Coordinate` type.

 Usage:
    struct MyPoint: DistanceMeasurable {
        // Implement the required properties and optional methods
    }

 - Note: This protocol allows types to calculate distances to other coordinates.

 - SeeAlso: `Coordinate`
 */
protocol DistanceMeasurable {
    /// The coordinates of the measurable object.
    var coordinate: Coordinate? { get }
    
    /**
     Measures the distance between the measurable object and a specified coordinate.

     - Parameter coordinate: The coordinate to measure the distance to.
     - Returns: The distance between the measurable object and the specified coordinate, in meters, or `nil` if the distance cannot be calculated.
     */
    func distance(to coordinate: Coordinate) -> Distance?
}

extension DistanceMeasurable {
    /**
     Default implementation of measuring the distance between the measurable object and a specified coordinate.

     - Parameter coordinate: The coordinate to measure the distance to.
     - Returns: The distance between the measurable object and the specified coordinate, in meters, or `nil` if the distance cannot be calculated.
     */
    func distance(to coordinate: Coordinate) -> Distance? {
        guard let ownCoordinate = self.coordinate else { return nil }
        return Helpers.lineDistanceBetweenCoordinates(from: ownCoordinate, to: coordinate)
    }
}

/** A distance in meters from an existing location. */
typealias Distance = Double
